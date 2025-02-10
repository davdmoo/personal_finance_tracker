part of 'budget_bloc.dart';

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    @Default([]) List<PopulatedBudget> budgets,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _BudgetState;
}
