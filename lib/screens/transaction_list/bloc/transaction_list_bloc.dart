import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'transaction_list_bloc.freezed.dart';
part 'transaction_list_event.dart';
part 'transaction_list_state.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  final AppDatabase db;

  TransactionListBloc(this.db) : super(_TransactionListState()) {
    on<TransactionListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(started: (event) async => await _onStarted(event, emit));
    });
  }

  Future<void> _onStarted(_Started event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final selectExpenseStatement = db.select(db.expenses).join([
        drift.leftOuterJoin(db.expenseCategories, db.expenseCategories.id.equalsExp(db.expenses.categoryId)),
        drift.leftOuterJoin(db.accounts, db.accounts.id.equalsExp(db.expenses.accountId)),
        drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.expenses.currencyId)),
      ])
        ..orderBy([drift.OrderingTerm(expression: db.expenses.transactionDate, mode: drift.OrderingMode.desc)]);
      final expenses = await selectExpenseStatement.map((row) {
        final expense = row.readTable(db.expenses);
        final category = row.readTableOrNull(db.expenseCategories);
        final account = row.readTableOrNull(db.accounts);
        final currency = row.readTableOrNull(db.currencies);

        return PopulatedExpense(
          expense: expense,
          category: category,
          account: account,
          currency: currency,
        );
      }).get();

      final selectIncomeStatement = db.select(db.incomes).join([
        drift.leftOuterJoin(db.incomeCategories, db.incomeCategories.id.equalsExp(db.incomes.categoryId)),
        drift.leftOuterJoin(db.accounts, db.accounts.id.equalsExp(db.incomes.accountId)),
        drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.incomes.currencyId)),
      ])
        ..orderBy([drift.OrderingTerm(expression: db.incomes.transactionDate, mode: drift.OrderingMode.desc)]);
      final incomes = await selectIncomeStatement.map((row) {
        final income = row.readTable(db.incomes);
        final category = row.readTableOrNull(db.incomeCategories);
        final account = row.readTableOrNull(db.accounts);
        final currency = row.readTableOrNull(db.currencies);

        return PopulatedIncome(
          income: income,
          category: category,
          account: account,
          currency: currency,
        );
      }).get();

      final accountOriginAlias = db.alias(db.accounts, "origin");
      final accountDestinationAlias = db.alias(db.accounts, "destination");
      final selectTransferStatement = db.select(db.transfers).join([
        drift.leftOuterJoin(accountOriginAlias, accountOriginAlias.id.equalsExp(db.transfers.accountOrigin)),
        drift.leftOuterJoin(
          accountDestinationAlias,
          accountDestinationAlias.id.equalsExp(db.transfers.accountDestination),
        ),
        drift.leftOuterJoin(db.currencies, db.currencies.id.equalsExp(db.transfers.currencyId)),
      ])
        ..orderBy([drift.OrderingTerm(expression: db.transfers.transactionDate, mode: drift.OrderingMode.desc)]);
      final transfers = await selectTransferStatement.map((row) {
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

      emit(state.copyWith(expenses: expenses, incomes: incomes, transfers: transfers));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
