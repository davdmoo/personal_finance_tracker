part of 'transaction_list_bloc.dart';

@freezed
class TransactionListEvent with _$TransactionListEvent {
  const factory TransactionListEvent.started() = _Started;
  const factory TransactionListEvent.expenseDeleted(int id) = _ExpenseDeleted;
  const factory TransactionListEvent.incomeDeleted(int id) = _IncomeDeleted;
  const factory TransactionListEvent.transferDeleted(int id) = _TransferDeleted;
}
