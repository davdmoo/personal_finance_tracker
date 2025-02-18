import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../extensions/string.extensions.dart';

class AccountGroupLogic {
  final AppDatabase db;
  const AccountGroupLogic(this.db);

  Future<List<AccountGroup>> findAll() async {
    final selectStatement = (db.select(db.accountGroups))..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
    return await selectStatement.get();
  }

  Future<AccountGroup> create({
    required String name,
  }) async {
    final insertedData = await db.transaction<AccountGroup>(
      () async {
        // get the latest order from all account groups
        final selectStatement = (db.select(db.accountGroups))
          ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
          ..limit(1);
        final result = await selectStatement.get();
        final accountGroup = result.firstOrNull;

        final order = accountGroup?.order ?? 0;
        final data = AccountGroupsCompanion.insert(
          name: name.capitalized.trim(),
          order: order + 1,
        );
        final newAccountGroup = await db.into(db.accountGroups).insertReturning(data);

        return newAccountGroup;
      },
    );

    return insertedData;
  }

  Future<AccountGroup> update({
    required int id,
    required String name,
  }) async {
    final data = AccountGroupsCompanion(name: drift.Value(name.capitalized.trim()));
    final query = db.update(db.accountGroups)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedAccountGroup = result.firstOrNull;
    if (updatedAccountGroup == null) {
      throw Exception("Account group is missing. It may have been deleted.");
    }

    return updatedAccountGroup;
  }

  Future<List<AccountGroup>> reorder(List<AccountGroup> accountGroups) async {
    return await db.transaction<List<AccountGroup>>(
      () async {
        final List<AccountGroup> updatedAccountGroups = [];

        for (int i = 0; i < accountGroups.length; i++) {
          final accountGroup = accountGroups[i];
          final data = AccountGroupsCompanion(order: drift.Value(i + 1));

          final query = db.update(db.accountGroups)..where((t) => t.id.equals(accountGroup.id));
          final result = await query.writeReturning(data);

          final updatedAccountGroup = result.firstOrNull;
          if (updatedAccountGroup == null) throw Exception("Failed while updating order.");

          updatedAccountGroups.add(updatedAccountGroup);
        }

        return updatedAccountGroups;
      },
    );
  }
}
