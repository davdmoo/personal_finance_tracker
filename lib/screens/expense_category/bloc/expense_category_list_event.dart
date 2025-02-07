part of 'expense_category_list_bloc.dart';

@freezed
class ExpenseCategoryListEvent with _$ExpenseCategoryListEvent {
  const factory ExpenseCategoryListEvent.started() = _Started;
}