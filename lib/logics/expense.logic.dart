import 'package:drift/drift.dart' as drift;

import '../database.dart';

class ExpenseLogic {
  final AppDatabase db;
  const ExpenseLogic(this.db);

  Future<List<PopulatedExpense>> findAll() async {
    final selectExpenseStatement = db.select(db.expenses).join([
      drift.leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.expenses.categoryId)),
      drift.leftOuterJoin(db.accounts, db.accounts.id.equalsExp(db.expenses.accountId)),
      drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.expenses.currencyId)),
    ])
      ..orderBy([drift.OrderingTerm(expression: db.expenses.transactionDate, mode: drift.OrderingMode.desc)]);
    final expenses = await selectExpenseStatement.map((row) {
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
