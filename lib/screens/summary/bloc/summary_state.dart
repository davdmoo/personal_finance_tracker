part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState({
    @Default([]) List<CategorizedExpense> topSpendingsByCategory,
    @Default([]) List<MonthlyExpense> monthlyTotalExpenses,
    @Default(0) double totalExpense,
    @Default(0) double totalIncome,
    @Default(TimeRange.daily) TimeRange timeRange,
    DateTimeRange? dateTimeRange,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _SummaryState;
}
