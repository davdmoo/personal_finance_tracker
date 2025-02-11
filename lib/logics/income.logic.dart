import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../models/categorized_income.model.dart';

class IncomeLogic {
  final AppDatabase db;
  const IncomeLogic(this.db);

  Future<List<PopulatedIncome>> findAll() async {
    final selectIncomeStatement = db.select(db.incomes).join([
      drift.leftOuterJoin(db.incomeCategories, db.incomeCategories.id.equalsExp(db.incomes.categoryId)),
      drift.leftOuterJoin(db.accounts, db.accounts.id.equalsExp(db.incomes.accountId)),
      drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.incomes.currencyId)),
    ])
      ..orderBy([drift.OrderingTerm(expression: db.incomes.transactionDate, mode: drift.OrderingMode.desc)]);
    final incomes = await selectIncomeStatement.map((row) {
      final income = row.readTable(db.incomes);
      final category = row.readTableOrNull(db.incomeCategories);
      final account = row.readTableOrNull(db.accounts);
      final currency = row.readTableOrNull(db.currencies);

      return PopulatedIncome(
        income: income,
        category: category,
        account: account,
        currency: currency,
      );
    }).get();

    return incomes;
  }

  Future<List<CategorizedIncome>> findCategorizedIncomes() async {
    final selectStatement = db.select(db.incomeCategories).join(
      [drift.innerJoin(db.incomes, db.incomeCategories.id.equalsExp(db.incomes.categoryId))],
    )
      ..addColumns([db.incomes.amount.sum()])
      ..groupBy([db.incomeCategories.id]);
    final categorizedIncomes = await selectStatement.map((row) {
      final category = row.readTable(db.incomeCategories);
      final totalAmount = row.read(db.incomes.amount.sum()) ?? 0;

      return CategorizedIncome(incomeCategory: category, totalAmount: totalAmount);
    }).get();

    return categorizedIncomes;
  }

  Future<Income> create({
    required DateTime transactionDate,
    required double amount,
    required int accountId,
    required int expenseCategoryId,
    required int currencyId,
    String? note,
  }) async {
    final data = IncomesCompanion.insert(
      categoryId: expenseCategoryId,
      accountId: accountId,
      currencyId: currencyId,
      amount: amount,
      note: note ?? "",
      transactionDate: transactionDate,
    );

    return await db.into(db.incomes).insertReturning(data);
  }

  Future<Income> update({
    required int id,
    required DateTime transactionDate,
    required double amount,
    required int accountId,
    required int incomeCategoryId,
    required int currencyId,
    String? note,
  }) async {
    final data = IncomesCompanion(
      categoryId: drift.Value(incomeCategoryId),
      accountId: drift.Value(accountId),
      currencyId: drift.Value(currencyId),
      amount: drift.Value(amount),
      note: drift.Value(note ?? ""),
      transactionDate: drift.Value(transactionDate),
    );
    final query = db.update(db.incomes)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedIncome = result.firstOrNull;
    if (updatedIncome == null) {
      throw Exception("Expense is missing. It may have been deleted.");
    }

    return updatedIncome;
  }
}
