part of 'budget_form_bloc.dart';

@freezed
class BudgetFormState with _$BudgetFormState {
  const factory BudgetFormState({
    Budget? savedBudget,
    @Default([]) List<ExpenseCategory> expenseCategories,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _BudgetFormState;
}
