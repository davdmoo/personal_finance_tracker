import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../database_provider.dart';
import '../extensions/string.extensions.dart';

class IncomeCategoryLogic {
  final DatabaseProvider databaseProvider;

  IncomeCategoryLogic(this.databaseProvider);

  Future<List<IncomeCategory>> findAll() async {
    final db = databaseProvider.database;

    final query = db.select(db.incomeCategories)..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
    return await query.get();
  }

  Future<IncomeCategory> create({
    required String name,
    String? description,
  }) async {
    final db = databaseProvider.database;

    final insertedData = await db.transaction<IncomeCategory>(() async {
      // get the latest order from all accounts
      final selectStatement = (db.select(db.incomeCategories))
        ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
        ..limit(1);
      final result = await selectStatement.get();
      final highestOrderCategory = result.firstOrNull;

      final order = highestOrderCategory?.order ?? 0;
      final data = IncomeCategoriesCompanion.insert(
        name: name.capitalized.trim(),
        order: order + 1,
        description: drift.Value(description?.capitalized.trim()),
      );
      final newCategory = await db.into(db.incomeCategories).insertReturning(data);

      return newCategory;
    });

    return insertedData;
  }

  Future<IncomeCategory> update({
    required int id,
    required String name,
    String? description,
  }) async {
    final data = IncomeCategoriesCompanion(
      name: drift.Value(name.capitalized.trim()),
      description: drift.Value(description?.capitalized.trim()),
    );

    final db = databaseProvider.database;
    final query = db.update(db.incomeCategories)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedCategory = result.firstOrNull;
    if (updatedCategory == null) {
      throw Exception("Category is missing. It may have been deleted.");
    }

    return updatedCategory;
  }

  Future<List<IncomeCategory>> reorder(List<IncomeCategory> categories) async {
    final db = databaseProvider.database;

    return await db.transaction<List<IncomeCategory>>(
      () async {
        final List<IncomeCategory> updatedCategories = [];

        for (int i = 0; i < categories.length; i++) {
          final category = categories[i];
          final data = IncomeCategoriesCompanion(order: drift.Value(i + 1));

          final query = db.update(db.incomeCategories)..where((t) => t.id.equals(category.id));
          final result = await query.writeReturning(data);

          final updatedCategory = result.firstOrNull;
          if (updatedCategory == null) throw Exception("Failed while updating order.");

          updatedCategories.add(updatedCategory);
        }

        return updatedCategories;
      },
    );
  }
}
