part of 'budget_bloc.dart';

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    @Default([]) List<BudgetProgress> budgets,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _BudgetState;
}
