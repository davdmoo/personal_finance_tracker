part of 'budget_form_bloc.dart';

@freezed
class BudgetFormEvent with _$BudgetFormEvent {
  const factory BudgetFormEvent.started() = _Started;
  const factory BudgetFormEvent.formSubmitted({
    required ExpenseCategory category,
    required double amount,
  }) = _FormSubmitted;
}
