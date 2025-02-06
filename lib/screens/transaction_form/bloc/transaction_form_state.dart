part of 'transaction_form_bloc.dart';

@freezed
class TransactionFormState with _$TransactionFormState {
  const factory TransactionFormState({
    Expense? savedExpense,
    Income? savedIncome,
    Transfer? savedTransfer,
    @Default([]) List<Account> accounts,
    @Default([]) List<Currency> currencies,
    @Default([]) List<ExpenseCategory> expenseCategories,
    @Default([]) List<IncomeCategory> incomeCategories,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _TransactionFormState;
}
