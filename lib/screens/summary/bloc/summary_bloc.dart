import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/time_range.enum.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../models/categorized_expense.model.dart';

part 'summary_bloc.freezed.dart';
part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;

  SummaryBloc({
    required this.expenseLogic,
    required this.incomeLogic,
  }) : super(_SummaryState()) {
    on<SummaryEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        timeRangeChanged: (event) => _onTimeRangeChanged(event, emit),
        customDateRangeSelected: (event) => _onCustomDateRangeSelected(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<SummaryState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      if (state.timeRange != TimeRange.custom) {
        emit(state.copyWith(dateTimeRange: state.timeRange.dateRange));
      }

      final dateTimeRange = state.dateTimeRange ?? state.timeRange.dateRange;
      final totalExpense = await expenseLogic.findTotalExpense(dateTimeRange);
      emit(state.copyWith(totalExpense: totalExpense));

      final totalIncome = await incomeLogic.findTotalIncome(dateTimeRange);
      emit(state.copyWith(totalIncome: totalIncome));

      final topSpendings = await expenseLogic.findCategorizedExpenses(dateRange: dateTimeRange, limit: 3);
      emit(state.copyWith(topSpendingsByCategory: topSpendings));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onTimeRangeChanged(_TimeRangeChanged event, Emitter<SummaryState> emit) {
    emit(state.copyWith(timeRange: event.value));
    add(SummaryEvent.started());
  }

  void _onCustomDateRangeSelected(_CustomDateRangeSelected event, Emitter<SummaryState> emit) {
    emit(state.copyWith(dateTimeRange: event.value, timeRange: TimeRange.custom));
    add(SummaryEvent.started());
  }
}
