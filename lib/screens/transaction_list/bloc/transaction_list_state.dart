part of 'transaction_list_bloc.dart';

@freezed
class TransactionListState with _$TransactionListState {
  const factory TransactionListState({
    @Default([]) List<PopulatedExpense> expenses,
    @Default([]) List<PopulatedIncome> incomes,
    @Default([]) List<PopulatedTransfer> transfers,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _TransactionListState;
}
