part of 'income_category_list_bloc.dart';

@freezed
class IncomeCategoryListState with _$IncomeCategoryListState {
  const factory IncomeCategoryListState({
    @Default([]) List<IncomeCategory> incomeCategories,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _IncomeCategoryListState;
}
