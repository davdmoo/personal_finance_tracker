part of 'category_form_bloc.dart';

@freezed
class CategoryFormState with _$CategoryFormState {
  const factory CategoryFormState({
    ExpenseCategory? expenseCategory,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _CategoryFormState;
}
