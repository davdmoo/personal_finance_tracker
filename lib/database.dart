import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';

part "database.g.dart";

class ExpenseCategories extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final TextColumn name = text().withLength(min: 1, max: 255)();
  late final TextColumn description = text().withLength(min: 0, max: 255).nullable()();
  late final IntColumn order = integer().unique()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class IncomeCategories extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final TextColumn name = text().withLength(min: 1, max: 255)();
  late final TextColumn description = text().withLength(min: 0, max: 255).nullable()();
  late final IntColumn order = integer().unique()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class Currencies extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final TextColumn name = text().withLength(min: 1, max: 255)();
  late final TextColumn code = text().withLength(min: 1, max: 255)();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class AccountGroups extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final TextColumn name = text().withLength(min: 1, max: 255).unique()();
  late final IntColumn order = integer().unique()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class Accounts extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn accountGroupId = integer().references(
    AccountGroups,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final TextColumn name = text().withLength(min: 1, max: 255).unique()();
  late final IntColumn order = integer().unique()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class PopulatedBudget {
  final Budget budget;
  final ExpenseCategory category;

  const PopulatedBudget({required this.budget, required this.category});
}

class Budgets extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn categoryId = integer()
      .references(
        ExpenseCategories,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )
      .unique()();
  late final RealColumn amount = real().check(amount.isBiggerThanValue(0.0))();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class BudgetAdjustments extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn budgetId = integer().references(
    Budgets,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final RealColumn customAmount = real().check(customAmount.isBiggerThanValue(0.0))();
  late final DateTimeColumn adjustmentDate = dateTime()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class PopulatedExpense {
  final Expense expense;
  final ExpenseCategory? category;
  final Account? account;
  final Currency? currency;

  const PopulatedExpense({required this.expense, this.category, this.account, this.currency});
}

class Expenses extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn categoryId = integer().references(
    ExpenseCategories,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn accountId = integer().references(
    Accounts,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn currencyId = integer().references(
    Currencies,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final RealColumn amount = real().check(amount.isBiggerThanValue(0.0))();
  late final TextColumn note = text().withLength(min: 0, max: 255)();
  late final DateTimeColumn transactionDate = dateTime()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class PopulatedIncome {
  final Income income;
  final IncomeCategory? category;
  final Account? account;
  final Currency? currency;

  const PopulatedIncome({required this.income, this.category, this.account, this.currency});
}

class Incomes extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn categoryId = integer().references(
    IncomeCategories,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn accountId = integer().references(
    Accounts,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn currencyId = integer().references(
    Currencies,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final RealColumn amount = real().check(amount.isBiggerThanValue(0.0))();
  late final TextColumn note = text().withLength(min: 0, max: 255)();
  late final DateTimeColumn transactionDate = dateTime()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class PopulatedTransfer {
  final Transfer transfer;
  final Account? accountOrigin;
  final Account? accountDestination;
  final Currency? currency;

  const PopulatedTransfer({required this.transfer, this.accountOrigin, this.accountDestination, this.currency});
}

class Transfers extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn accountOrigin = integer().references(
    Accounts,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn accountDestination = integer().references(
    Accounts,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn currencyId = integer().references(
    Currencies,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final RealColumn amount = real().check(amount.isBiggerThanValue(0.0))();
  late final RealColumn fee = real().withDefault(Constant(0.0))();
  late final TextColumn note = text().withLength(min: 0, max: 255)();
  late final DateTimeColumn transactionDate = dateTime()();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => ['CHECK (account_origin != account_destination)'];
}

class Goals extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final IntColumn accountId = integer().references(
    Accounts,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final IntColumn currencyId = integer().references(
    Currencies,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  late final RealColumn targetAmount = real().check(targetAmount.isBiggerThanValue(0.0))();
  late final DateTimeColumn targetDate = dateTime()();
  late final TextColumn note = text().withLength(min: 0, max: 255)();
  late final DateTimeColumn createdAt = dateTime().withDefault(currentDateAndTime)();
  late final DateTimeColumn updatedAt = dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [
  ExpenseCategories,
  IncomeCategories,
  Currencies,
  AccountGroups,
  Accounts,
  Budgets,
  Expenses,
  Incomes,
  Transfers
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> populateDatabase() async {
    try {
      log("Populating database..");

      final categoryCount = await (select(expenseCategories)..where((t) => t.id.isNotNull())).get();
      if (categoryCount.isEmpty) {
        await batch((batch) {
          batch.insertAllOnConflictUpdate(
            expenseCategories,
            [
              ExpenseCategoriesCompanion.insert(name: 'Food', order: 1),
              ExpenseCategoriesCompanion.insert(name: 'Health', order: 2),
              ExpenseCategoriesCompanion.insert(name: 'Lifestyle', order: 3),
            ],
          );
        });
      }

      final incomeCategoryCount = await (select(incomeCategories)..where((t) => t.id.isNotNull())).get();
      if (incomeCategoryCount.isEmpty) {
        await batch((batch) {
          batch.insertAllOnConflictUpdate(
            incomeCategories,
            [
              IncomeCategoriesCompanion.insert(name: 'Salary', order: 1),
              IncomeCategoriesCompanion.insert(name: 'Gift', order: 2),
              IncomeCategoriesCompanion.insert(name: 'Manual', order: 3),
            ],
          );
        });
      }

      final accountGroupCount = await (select(accountGroups)..where((t) => t.id.isNotNull())).get();
      if (accountGroupCount.isEmpty) {
        await batch((batch) {
          batch.insertAllOnConflictUpdate(
            accountGroups,
            [
              AccountGroupsCompanion.insert(name: "Accounts", order: 1),
              AccountGroupsCompanion.insert(name: "Cash", order: 2),
            ],
          );
        });
      }

      final accountCount = await (select(accounts)..where((t) => t.id.isNotNull())).get();
      if (accountCount.isEmpty) {
        await batch((batch) {
          batch.insertAllOnConflictUpdate(
            accounts,
            [
              AccountsCompanion.insert(accountGroupId: 1, name: "Debit Card", order: 1),
              AccountsCompanion.insert(accountGroupId: 2, name: "Wallet", order: 2),
            ],
          );
        });
      }

      final currencyCount = await (select(currencies)..where((t) => t.id.isNotNull())).get();
      if (currencyCount.isEmpty) {
        await batch((batch) {
          batch.insertAllOnConflictUpdate(
            currencies,
            [
              CurrenciesCompanion.insert(name: "Indonesian Rupiah", code: "IDR"),
              CurrenciesCompanion.insert(name: "US Dollar", code: "USD"),
            ],
          );
        });
      }

      log("Populating database successful!");
    } catch (err) {
      log(err.toString());
    }
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      beforeOpen: (openingDetails) async {
        await customStatement('PRAGMA foreign_keys = ON');

        // delete all tables on debug mode
        if (kDebugMode) {
          log("RUNNING");
          final m = Migrator(this);
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
            await m.createTable(table);
          }
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    // By default, `driftDatabase` from `package:drift_flutter` stores the
    // database files in `getApplicationDocumentsDirectory()`.
    return driftDatabase(
      name: 'finance_tracker',
      native: const DriftNativeOptions(),
    );
  }
}
