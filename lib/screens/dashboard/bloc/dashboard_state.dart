part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<CategorizedExpense> categorizedExpenses,
    @Default([]) List<CategorizedIncome> categorizedIncomes,
    @Default([]) List<MonthlyExpense> monthlyTotalExpenses,
    @Default([]) List<BarChartGroupData> barChartGroupData,
    @Default(TimeRange.daily) TimeRange timeRange,
    DateTimeRange? dateTimeRange,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _DashboardState;
  const DashboardState._();

  double get totalExpense {
    return categorizedExpenses.fold(0, (prevValue, el) => prevValue + el.totalAmount);
  }

  double get totalIncome {
    return categorizedIncomes.fold(0, (prevValue, el) => prevValue + el.totalAmount);
  }

  double get highestMonthlyExpense {
    final copied = [...monthlyTotalExpenses];
    copied.sort((a, b) => (a.amount - b.amount).toInt());

    return copied.firstOrNull?.amount ?? 0;
  }
}
