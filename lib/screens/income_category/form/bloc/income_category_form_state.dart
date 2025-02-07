part of 'income_category_form_bloc.dart';

@freezed
class IncomeCategoryFormState with _$IncomeCategoryFormState {
  const factory IncomeCategoryFormState({
    IncomeCategory? incomeCategory,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _IncomeCategoryFormState;
}
