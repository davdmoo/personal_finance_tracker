import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../extensions/string.extensions.dart';

class IncomeCategoryLogic {
  final AppDatabase db;
  const IncomeCategoryLogic(this.db);

  Future<List<IncomeCategory>> findAll() async {
    return await db.select(db.incomeCategories).get();
  }

  Future<IncomeCategory> create({
    required String name,
    String? description,
  }) async {
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
    final query = db.update(db.incomeCategories)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedCategory = result.firstOrNull;
    if (updatedCategory == null) {
      throw Exception("Category is missing. It may have been deleted.");
    }

    return updatedCategory;
  }
}
