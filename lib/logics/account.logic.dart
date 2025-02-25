import 'package:drift/drift.dart' as drift;

import '../database.dart';
import '../database_provider.dart';
import '../extensions/string.extensions.dart';

class AccountLogic {
  final DatabaseProvider databaseProvider;

  AccountLogic(this.databaseProvider);

  Future<List<Account>> findAll() async {
    final db = databaseProvider.database;

    final query = (db.select(db.accounts))..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
    return await query.get();
  }

  Future<double> getAccountBalance(Account account) async {
    final db = databaseProvider.database;
    final expenseSumStatement = await (db.selectOnly(db.expenses)
          ..where(db.expenses.accountId.equals(account.id))
          ..addColumns([db.expenses.amount.sum()]))
        .getSingle();
    final expenseSum = expenseSumStatement.read(db.expenses.amount.sum()) ?? 0;

    final incomeSumStatement = await (db.selectOnly(db.incomes)
          ..where(db.incomes.accountId.equals(account.id))
          ..addColumns([db.incomes.amount.sum()]))
        .getSingle();
    final incomeSum = incomeSumStatement.read(db.incomes.amount.sum()) ?? 0;

    final transferOutSumStatement = await (db.selectOnly(db.transfers)
          ..where(db.transfers.accountOrigin.equals(account.id))
          ..addColumns([db.transfers.amount.sum(), db.transfers.fee.sum()]))
        .getSingle();
    final transferOutSum = transferOutSumStatement.read(db.transfers.amount.sum()) ?? 0;
    final transferFeeSum = transferOutSumStatement.read(db.transfers.fee.sum()) ?? 0;

    final transferInSumStatement = await (db.selectOnly(db.transfers)
          ..where(db.transfers.accountDestination.equals(account.id))
          ..addColumns([db.transfers.amount.sum()]))
        .getSingle();
    final transferInSum = transferInSumStatement.read(db.transfers.amount.sum()) ?? 0;

    final totalBalance = incomeSum + transferInSum - expenseSum - transferOutSum - transferFeeSum;

    return totalBalance;
  }

  Future<Account> create({
    required String name,
    required int accountGroup,
  }) async {
    final db = databaseProvider.database;
    final insertedData = await db.transaction<Account>(
      () async {
        // get the latest order from all accounts
        final selectStatement = (db.select(db.accounts))
          ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
          ..limit(1);
        final result = await selectStatement.get();
        final highestOrderAccount = result.firstOrNull;

        final order = highestOrderAccount?.order ?? 0;
        final data = AccountsCompanion.insert(
          name: name.capitalized.trim(),
          order: order + 1,
          accountGroupId: accountGroup,
        );
        final newAccount = await db.into(db.accounts).insertReturning(data);

        return newAccount;
      },
    );

    return insertedData;
  }

  Future<Account> update({
    required int id,
    required String name,
    required int accountGroup,
  }) async {
    final data = AccountsCompanion(name: drift.Value(name.capitalized.trim()));
    final db = databaseProvider.database;
    final query = db.update(db.accounts)..where((tbl) => tbl.id.equals(id));
    final result = await query.writeReturning(data);

    final updatedAccount = result.firstOrNull;
    if (updatedAccount == null) {
      throw Exception("Account is missing. It may have been deleted.");
    }

    return updatedAccount;
  }

  Future<List<Account>> reorder(List<Account> accounts) async {
    final db = databaseProvider.database;

    return await db.transaction<List<Account>>(
      () async {
        final List<Account> updatedAccounts = [];

        for (int i = 0; i < accounts.length; i++) {
          final account = accounts[i];
          final data = AccountsCompanion(order: drift.Value(i + 1));

          final query = db.update(db.accounts)..where((t) => t.id.equals(account.id));
          final result = await query.writeReturning(data);

          final updatedAccount = result.firstOrNull;
          if (updatedAccount == null) throw Exception("Failed while updating order.");

          updatedAccounts.add(updatedAccount);
        }

        return updatedAccounts;
      },
    );
  }
}
