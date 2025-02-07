part of 'expense_category_list_bloc.dart';

@freezed
class ExpenseCategoryListState with _$ExpenseCategoryListState {
  const factory ExpenseCategoryListState({
    @Default([]) List<ExpenseCategory> expenseCategories,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _ExpenseCategoryListState;
}
