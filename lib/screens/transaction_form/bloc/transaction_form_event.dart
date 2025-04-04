part of 'transaction_form_bloc.dart';

@freezed
class TransactionFormEvent with _$TransactionFormEvent {
  const factory TransactionFormEvent.started() = _Started;
  const factory TransactionFormEvent.expenseFormSubmitted({
    required DateTime transactionDate,
    required double amount,
    required Account account,
    required ExpenseCategory category,
    String? note,
  }) = _ExpenseFormSubmitted;
  const factory TransactionFormEvent.incomeFormSubmitted({
    required DateTime transactionDate,
    required double amount,
    required Account account,
    required IncomeCategory category,
    String? note,
  }) = _IncomeFormSubmitted;
  const factory TransactionFormEvent.transferFormSubmitted({
    required DateTime transactionDate,
    required double amount,
    required double fee,
    required Account accountOrigin,
    required Account accountDestination,
    String? note,
  }) = _TransferFormSubmitted;
}
