import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../database_provider.dart';
import '../extensions/string.extensions.dart';

class CurrencyLogic {
  final DatabaseProvider databaseProvider;
  CurrencyLogic(this.databaseProvider);

  Future<List<Currency>> findAll() async {
    final db = databaseProvider.database;
    return await db.select(db.currencies).get();
  }

  Future<Currency> create({
    required String name,
    required String code,
  }) async {
    final data = CurrenciesCompanion.insert(name: name.capitalized.trim(), code: code.toUpperCase());

    final db = databaseProvider.database;
    return await db.into(db.currencies).insertReturning(data);
  }

  Future<Currency> update({
    required int id,
    required String name,
    required String code,
  }) async {
    final data = CurrenciesCompanion(
      name: drift.Value(name.capitalized.trim()),
      code: drift.Value(code),
    );

    final db = databaseProvider.database;
    final query = db.update(db.currencies)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedCurrency = result.firstOrNull;
    if (updatedCurrency == null) {
      throw Exception("Currency is missing. It may have been deleted.");
    }

    return updatedCurrency;
  }
}
