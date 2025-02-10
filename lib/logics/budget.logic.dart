import 'package:drift/drift.dart';

import '../database.dart';

class BudgetLogic {
  final AppDatabase db;
  const BudgetLogic(this.db);

  Future<List<PopulatedBudget>> findAll() async {
    final selectBudgetStatement = db.select(db.budgets).join([
      leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.budgets.categoryId)),
    ])
      ..orderBy([OrderingTerm(expression: db.budgets.updatedAt, mode: OrderingMode.desc)]);
    final budgets = await selectBudgetStatement.map((row) {
      final budget = row.readTable(db.budgets);
      final category = row.readTable(db.expenseCategories);

      return PopulatedBudget(budget: budget, category: category);
    }).get();

    return budgets;
  }

  Future<Budget> create({
    required int categoryId,
    required double amount,
  }) async {
    final budget = await db.transaction<Budget>(
      () async {
        final selectStatement = db.select(db.budgets)..where((tbl) => tbl.categoryId.equals(categoryId));
        final existingBudget = await selectStatement.getSingleOrNull();
        if (existingBudget == null) {
          final data = BudgetsCompanion.insert(
            categoryId: categoryId,
            amount: amount,
          );

          return await db.into(db.budgets).insertReturning(data);
        }

        return await update(id: existingBudget.id, categoryId: categoryId, amount: amount);
      },
    );

    return budget;
  }

  Future<Budget> update({
    required int id,
    required int categoryId,
    required double amount,
  }) async {
    final data = BudgetsCompanion(
      categoryId: Value(categoryId),
      amount: Value(amount),
    );

    final query = db.update(db.budgets)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedBudget = result.firstOrNull;
    if (updatedBudget == null) {
      throw Exception("Budget is missing. It may have been deleted.");
    }

    return updatedBudget;
  }
}
