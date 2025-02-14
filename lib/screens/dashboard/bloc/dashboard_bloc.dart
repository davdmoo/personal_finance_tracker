import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/time_range.enum.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../models/categorized_expense.model.dart';
import '../../../models/categorized_income.model.dart';
import '../../../models/monthly_expense.model.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;

  DashboardBloc({required this.expenseLogic, required this.incomeLogic}) : super(_DashboardState()) {
    on<DashboardEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        timeRangeChanged: (event) => _onTimeRangeChanged(event, emit),
        customDateRangeSelected: (event) => _onCustomDateRangeSelected(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<DashboardState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, dateTimeRange: state.timeRange.dateRange));

      final categorizedExpenses = await expenseLogic.findCategorizedExpenses(
        dateRange: state.timeRange.dateRange,
      );
      emit(state.copyWith(categorizedExpenses: categorizedExpenses));

      final categorizedIncomes = await incomeLogic.findCategorizedIncomes();
      emit(state.copyWith(categorizedIncomes: categorizedIncomes));

      final monthlyTotalExpenses = await expenseLogic.findMonthlyTotalExpense();
      final List<BarChartGroupData> barChartGroupData = [];
      for (int i = 0; i < monthlyTotalExpenses.length; i++) {
        final el = monthlyTotalExpenses[i];
        final data = BarChartGroupData(x: i, barRods: [BarChartRodData(toY: el.amount)], barsSpace: 4);

        barChartGroupData.add(data);
      }

      emit(state.copyWith(monthlyTotalExpenses: monthlyTotalExpenses, barChartGroupData: barChartGroupData));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onTimeRangeChanged(_TimeRangeChanged event, Emitter<DashboardState> emit) {
    emit(state.copyWith(timeRange: event.value));
    add(DashboardEvent.started());
  }

  void _onCustomDateRangeSelected(_CustomDateRangeSelected event, Emitter<DashboardState> emit) {
    emit(state.copyWith(dateTimeRange: event.value, timeRange: TimeRange.custom));
    add(DashboardEvent.started());
  }
}
