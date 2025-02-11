import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../extensions/string.extensions.dart';

class ExpenseCategoryLogic {
  final AppDatabase db;
  const ExpenseCategoryLogic(this.db);

  Future<List<ExpenseCategory>> findAll() async {
    final selectStatement = db.select(db.expenseCategories)..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
    return await selectStatement.get();
  }

  Future<ExpenseCategory> create({
    required String name,
    String? description,
  }) async {
    final insertedData = await db.transaction<ExpenseCategory>(() async {
      // get the latest order from all accounts
      final selectStatement = (db.select(db.expenseCategories))
        ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
        ..limit(1);
      final result = await selectStatement.get();
      final highestOrderCategory = result.firstOrNull;

      final order = highestOrderCategory?.order ?? 0;
      final data = ExpenseCategoriesCompanion.insert(
        name: name.capitalized.trim(),
        order: order + 1,
        description: drift.Value(description?.capitalized.trim()),
      );
      final newCategory = await db.into(db.expenseCategories).insertReturning(data);

      return newCategory;
    });

    return insertedData;
  }

  Future<ExpenseCategory> update({
    required int id,
    required String name,
    String? description,
  }) async {
    final data = ExpenseCategoriesCompanion(
      name: drift.Value(name.capitalized.trim()),
      description: drift.Value(description?.capitalized.trim()),
    );
    final query = db.update(db.expenseCategories)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedCategory = result.firstOrNull;
    if (updatedCategory == null) {
      throw Exception("Category is missing. It may have been deleted.");
    }

    return updatedCategory;
  }
}
