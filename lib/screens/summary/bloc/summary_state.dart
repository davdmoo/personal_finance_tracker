part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState({
    @Default([]) List<CategorizedExpense> topSpendingsByCategory,
    @Default(0) double totalExpense,
    @Default(0) double totalIncome,
    @Default(TimeRange.daily) TimeRange timeRange,
    DateTimeRange? dateTimeRange,
    @Default(false) bool isLoading,
    @Default(false) bool isDownloading,
    File? excelReport,
    Exception? error,
  }) = _SummaryState;
}
