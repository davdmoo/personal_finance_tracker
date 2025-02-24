import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../enums/time_range.enum.dart';
import '../../../extensions/date_time.extensions.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/transfer.logic.dart';

part 'transaction_list_bloc.freezed.dart';
part 'transaction_list_event.dart';
part 'transaction_list_state.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;
  final TransferLogic transferLogic;

  TransactionListBloc({
    required this.expenseLogic,
    required this.incomeLogic,
    required this.transferLogic,
  }) : super(_TransactionListState()) {
    on<TransactionListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        expenseDeleted: (event) async => await _onExpenseDeleted(event, emit),
        incomeDeleted: (event) async => await _onIncomeDeleted(event, emit),
        transferDeleted: (event) async => await _onTransferDeleted(event, emit),
        timeRangeChanged: (event) => _onTimeRangeChanged(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      DateTimeRange? dateRange = state.customDateRange;
      if (state.timeRange == TimeRange.custom) {
        if (dateRange == null) throw Exception("You must pick a date range");
      } else {
        dateRange = state.timeRange.dateRange;
      }

      final expenses = await expenseLogic.findAll(dateRange: dateRange);
      final mappedExpenses = expenseLogic.mapExpensesByDate(expenses);

      final incomes = await incomeLogic.findAll(dateRange: dateRange);
      final mappedIncomes = incomeLogic.mapIncomesByDate(incomes);

      final transfers = await transferLogic.findAll(dateRange: dateRange);
      final mappedTransfers = transferLogic.mapTransfersByDate(transfers);

      final Map<DateTime, List<Object>> allTransactions = {};
      for (final item in mappedExpenses.entries) {
        final date = item.key.startOfDay;
        final value = item.value;

        allTransactions[date] = [...allTransactions[date] ?? [], ...value];
      }

      for (final item in mappedIncomes.entries) {
        final date = item.key.startOfDay;
        final value = item.value;

        allTransactions[date] = [...allTransactions[date] ?? [], ...value];
      }

      for (final item in mappedTransfers.entries) {
        final date = item.key.startOfDay;
        final value = item.value;

        allTransactions[date] = [...allTransactions[date] ?? [], ...value];
      }

      final totalIncome = await incomeLogic.findTotalIncome(dateRange);
      final totalExpense = await expenseLogic.findTotalExpense(dateRange);

      emit(
        state.copyWith(
          expenses: expenses,
          incomes: incomes,
          transfers: transfers,
          allTransactions: allTransactions,
          totalIncome: totalIncome,
          totalExpense: totalExpense,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onExpenseDeleted(_ExpenseDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      await expenseLogic.deleteById(event.id);
      add(TransactionListEvent.started());
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onIncomeDeleted(_IncomeDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      /// dismissible widget needs to be immediately removed once handler was fired
      /// so we try to remove and emit the expenses first before then fetching the updated list
      List<PopulatedIncome> incomes = [...state.incomes];
      incomes.removeWhere((el) => el.income.id == event.id);
      emit(state.copyWith(incomes: incomes));

      await incomeLogic.deleteById(event.id);
      add(TransactionListEvent.started());
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onTransferDeleted(_TransferDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      /// dismissible widget needs to be immediately removed once handler was fired
      /// so we try to remove and emit the expenses first before then fetching the updated list
      List<PopulatedTransfer> transfers = [...state.transfers];
      transfers.removeWhere((el) => el.transfer.id == event.id);
      emit(state.copyWith(transfers: transfers));

      await transferLogic.deleteById(event.id);
      add(TransactionListEvent.started());
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onTimeRangeChanged(_TimeRangeChanged event, Emitter<TransactionListState> emit) {
    DateTimeRange? dateRange = event.customDateRange;
    if (event.value == TimeRange.custom) {
      if (dateRange == null) return;
      dateRange = DateTimeRange(start: dateRange.start, end: dateRange.end.endOfDay);
    }

    emit(state.copyWith(timeRange: event.value, customDateRange: dateRange));
    add(TransactionListEvent.started());
  }
}
