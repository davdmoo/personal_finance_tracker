import 'package:drift/drift.dart';

import '../database.dart';
import '../database_provider.dart';
import '../models/budget_progress.model.dart';

class BudgetLogic {
  final DatabaseProvider databaseProvider;

  BudgetLogic(this.databaseProvider);

  Future<List<BudgetProgress>> findAll() async {
    final db = databaseProvider.database;
    final query = db.select(db.budgets).join([
      leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.budgets.categoryId)),
    ])
      ..orderBy([OrderingTerm(expression: db.budgets.updatedAt, mode: OrderingMode.desc)]);
    final budgets = await query.asyncMap((row) async {
      final budget = row.readTable(db.budgets);
      final budgetProgress = await getBudgetProgress(budget.id);

      return BudgetProgress(
        budget: budgetProgress.budget,
        usedAmount: budgetProgress.usedAmount,
      );
    }).get();

    return budgets;
  }

  Future<BudgetProgress> getBudgetProgress(int id) async {
    final db = databaseProvider.database;

    final selectBudgetStatement = db.select(db.budgets).join([
      leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.budgets.categoryId)),
    ])
      ..where(db.budgets.id.equals(id));
    final populatedBudget = await selectBudgetStatement.map((row) {
      final budget = row.readTable(db.budgets);
      final category = row.readTable(db.expenseCategories);

      return PopulatedBudget(budget: budget, category: category);
    }).getSingleOrNull();
    if (populatedBudget == null) throw Exception("Budget not found. It may have been deleted.");

    final expenseSumStatement = await (db.selectOnly(db.expenses)
          ..where(db.expenses.categoryId.equals(populatedBudget.category.id))
          ..addColumns([db.expenses.amount.sum()]))
        .getSingle();
    final expenseSum = expenseSumStatement.read(db.expenses.amount.sum()) ?? 0;

    return BudgetProgress(budget: populatedBudget, usedAmount: expenseSum);
  }

  Future<Budget> create({
    required int categoryId,
    required double amount,
  }) async {
    final db = databaseProvider.database;

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

    final db = databaseProvider.database;
    final query = db.update(db.budgets)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedBudget = result.firstOrNull;
    if (updatedBudget == null) {
      throw Exception("Budget is missing. It may have been deleted.");
    }

    return updatedBudget;
  }
}
