import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

import '../database.dart';
import '../database_provider.dart';
import '../extensions/date_time.extensions.dart';

class TransferLogic {
  final DatabaseProvider databaseProvider;

  TransferLogic(this.databaseProvider);

  Map<DateTime, List<PopulatedTransfer>> mapTransfersByDate(List<PopulatedTransfer> transfers) {
    final Map<DateTime, List<PopulatedTransfer>> mappedTransfers = {};

    for (final item in transfers) {
      final date = item.transfer.transactionDate.startOfDay;
      if (mappedTransfers[date] == null) {
        mappedTransfers[date] = [item];
      } else {
        mappedTransfers[date]?.add(item);
      }
    }

    return mappedTransfers;
  }

  Future<List<PopulatedTransfer>> findAll({DateTimeRange? dateRange}) async {
    final db = databaseProvider.database;
    final accountOriginAlias = db.alias(db.accounts, "origin");
    final accountDestinationAlias = db.alias(db.accounts, "destination");

    var query = db.select(db.transfers).join([
      drift.leftOuterJoin(accountOriginAlias, accountOriginAlias.id.equalsExp(db.transfers.accountOrigin)),
      drift.leftOuterJoin(
        accountDestinationAlias,
        accountDestinationAlias.id.equalsExp(db.transfers.accountDestination),
      ),
      drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.transfers.currencyId)),
    ])
      ..orderBy([drift.OrderingTerm(expression: db.transfers.transactionDate, mode: drift.OrderingMode.desc)]);

    if (dateRange != null) {
      query = query..where(db.transfers.transactionDate.isBetweenValues(dateRange.start, dateRange.end));
    }

    final transfers = await query.map((row) {
      final transfer = row.readTable(db.transfers);
      final accountOrigin = row.readTableOrNull(accountOriginAlias);
      final accountDestination = row.readTableOrNull(accountDestinationAlias);
      final currency = row.readTableOrNull(db.currencies);

      return PopulatedTransfer(
        transfer: transfer,
        accountOrigin: accountOrigin,
        accountDestination: accountDestination,
        currency: currency,
      );
    }).get();

    return transfers;
  }

  Future<Transfer> create({
    required DateTime transactionDate,
    required double amount,
    required double fee,
    required int accountOrigin,
    required int accountDestination,
    required int currency,
    String? note,
  }) async {
    final data = TransfersCompanion.insert(
      accountOrigin: accountOrigin,
      accountDestination: accountDestination,
      currencyId: currency,
      amount: amount,
      fee: drift.Value(fee),
      note: note ?? "",
      transactionDate: transactionDate,
    );

    final db = databaseProvider.database;
    return await db.into(db.transfers).insertReturning(data);
  }

  Future<Transfer> update({
    required int id,
    required DateTime transactionDate,
    required double amount,
    required double fee,
    required int accountOrigin,
    required int accountDestination,
    required int currency,
    String? note,
  }) async {
    final data = TransfersCompanion(
      accountOrigin: drift.Value(accountOrigin),
      accountDestination: drift.Value(accountDestination),
      currencyId: drift.Value(currency),
      amount: drift.Value(amount),
      fee: drift.Value(fee),
      note: drift.Value(note ?? ""),
      transactionDate: drift.Value(transactionDate),
    );

    final db = databaseProvider.database;
    final query = db.update(db.transfers)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedTransfer = result.firstOrNull;
    if (updatedTransfer == null) {
      throw Exception("Transfer is missing. It may have been deleted.");
    }

    return await db.into(db.transfers).insertReturning(data);
  }

  Future<void> deleteById(int id) async {
    final db = databaseProvider.database;
    final query = db.delete(db.transfers)..where((tbl) => tbl.id.equals(id));
    await query.go();
  }
}
