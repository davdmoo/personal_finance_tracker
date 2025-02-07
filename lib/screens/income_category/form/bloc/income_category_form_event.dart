part of 'income_category_form_bloc.dart';

@freezed
class IncomeCategoryFormEvent with _$IncomeCategoryFormEvent {
  const factory IncomeCategoryFormEvent.started() = _Started;
  const factory IncomeCategoryFormEvent.formSubmitted({
    required String name,
    String? description,
  }) = _FormSubmitted;
}
