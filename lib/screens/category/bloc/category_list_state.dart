part of 'category_list_bloc.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState({
    @Default([]) List<ExpenseCategory> categories,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _CategoryListState;
}
