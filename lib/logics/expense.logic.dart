import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

import '../database.dart';
import '../models/categorized_expense.model.dart';
import '../models/monthly_expense.model.dart';

class ExpenseLogic {
  final AppDatabase db;
  const ExpenseLogic(this.db);

  Future<List<PopulatedExpense>> findAll({DateTimeRange? dateRange}) async {
    var query = db.select(db.expenses).join([
      drift.leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.expenses.categoryId)),
      drift.leftOuterJoin(db.accounts, db.accounts.id.equalsExp(db.expenses.accountId)),
      drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.expenses.currencyId)),
    ])
      ..orderBy([drift.OrderingTerm(expression: db.expenses.transactionDate, mode: drift.OrderingMode.desc)]);

    if (dateRange != null) {
      print("Test");
      query = query..where(db.expenses.transactionDate.isBetweenValues(dateRange.start, dateRange.end));
    }

    final expenses = await query.map((row) {
      final expense = row.readTable(db.expenses);
      final category = row.readTableOrNull(db.expenseCategories);
      final account = row.readTableOrNull(db.accounts);
      final currency = row.readTableOrNull(db.currencies);

      return PopulatedExpense(
        expense: expense,
        category: category,
        account: account,
        currency: currency,
      );
    }).get();

    return expenses;
  }

  Future<List<MonthlyExpense>> findMonthlyTotalExpense() async {
    final now = DateTime.now();

    /// all the data is in UTC (automatically converted by drift on select, insert, or update).
    /// we use custom expression here so we need to manually add the timezone
    final timeZone = now.timeZoneOffset.inHours;
    String timeZoneString = "+$timeZone";
    if (timeZone.isNegative) {
      timeZoneString = "-${timeZone.abs()}";
    }

    final sixMonthsAgo = DateTime.utc(now.year, now.month - 5, 1);
    final month = drift.CustomExpression<String>(
      "strftime('%Y-%m', datetime(${db.expenses.transactionDate.name}, 'unixepoch', '$timeZoneString hours'))",
    );
    final sum = db.expenses.amount.sum();

    final query = db.selectOnly(db.expenses)
      ..where(db.expenses.transactionDate.isBiggerOrEqualValue(sixMonthsAgo))
      ..addColumns([month, sum])
      ..groupBy([month])
      ..orderBy([drift.OrderingTerm.asc(month)]);
    final result = await query.map((row) {
      final date = row.read(month)?.split("-") ?? []; // will return "YYYY-mm";

      final y = int.tryParse(date[0]) ?? DateTime.now().year;
      final m = int.tryParse(date[1]) ?? DateTime.now().month;

      final amount = row.read(sum) ?? 0;

      return MonthlyExpense(year: y, month: m, amount: amount);
    }).get();

    return result;
  }

  Future<List<CategorizedExpense>> findCategorizedExpenses({required DateTimeRange dateRange, int? limit}) async {
    final sum = db.expenses.amount.sum();

    var selectStatement = db.select(db.expenseCategories).join(
      [
        drift.innerJoin(
          db.expenses,
          db.expenses.categoryId.equalsExp(db.expenseCategories.id),
          useColumns: false,
        )
      ],
    )
      ..where(db.expenses.transactionDate.isBetweenValues(dateRange.start, dateRange.end))
      ..addColumns([sum])
      ..orderBy([drift.OrderingTerm.desc(sum)])
      ..groupBy([db.expenseCategories.id]);
    if (limit != null) {
      selectStatement = selectStatement..limit(limit);
    }

    final categorizedExpenses = await selectStatement.map((row) {
      final category = row.readTable(db.expenseCategories);
      final totalAmount = row.read(sum) ?? 0;

      return CategorizedExpense(expenseCategory: category, totalAmount: totalAmount);
    }).get();

    return categorizedExpenses;
  }

  Future<double> findTotalExpense(DateTimeRange dateRange) async {
    final sum = db.expenses.amount.sum();

    final selectStatement = db.selectOnly(db.expenses)
      ..where(db.expenses.transactionDate.isBetweenValues(dateRange.start, dateRange.end))
      ..addColumns([sum]);
    final totalExpense = await selectStatement.map((row) => row.read(sum) ?? 0).getSingle();

    return totalExpense;
  }

  Future<Expense> create({
    required DateTime transactionDate,
    required double amount,
    required int accountId,
    required int expenseCategoryId,
    required int currencyId,
    String? note,
  }) async {
    final data = ExpensesCompanion.insert(
      categoryId: expenseCategoryId,
      accountId: accountId,
      currencyId: currencyId,
      amount: amount,
      note: note ?? "",
      transactionDate: transactionDate,
    );

    return await db.into(db.expenses).insertReturning(data);
  }

  Future<Expense> update({
    required int id,
    required DateTime transactionDate,
    required double amount,
    required int accountId,
    required int expenseCategoryId,
    required int currencyId,
    String? note,
  }) async {
    final data = ExpensesCompanion(
      categoryId: drift.Value(expenseCategoryId),
      accountId: drift.Value(accountId),
      currencyId: drift.Value(currencyId),
      amount: drift.Value(amount),
      note: drift.Value(note ?? ""),
      transactionDate: drift.Value(transactionDate),
    );
    final query = db.update(db.expenses)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedExpense = result.firstOrNull;
    if (updatedExpense == null) {
      throw Exception("Expense is missing. It may have been deleted.");
    }

    return updatedExpense;
  }
}
