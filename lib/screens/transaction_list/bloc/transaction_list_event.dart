part of 'transaction_list_bloc.dart';

@freezed
class TransactionListEvent with _$TransactionListEvent {
  const factory TransactionListEvent.started() = _Started;
}