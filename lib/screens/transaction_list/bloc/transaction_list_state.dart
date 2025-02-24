part of 'transaction_list_bloc.dart';

@freezed
class TransactionListState with _$TransactionListState {
  const factory TransactionListState({
    @Default(0) double totalIncome,
    @Default(0) double totalExpense,
    @Default(TimeRange.monthly) TimeRange timeRange,
    DateTimeRange? customDateRange,
    @Default([]) List<PopulatedExpense> expenses,
    @Default([]) List<PopulatedIncome> incomes,
    @Default([]) List<PopulatedTransfer> transfers,
    @Default({}) Map<DateTime, List<Object>> allTransactions,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _TransactionListState;
  const TransactionListState._();
}
