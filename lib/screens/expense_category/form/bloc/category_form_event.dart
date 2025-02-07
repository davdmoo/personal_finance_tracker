part of 'category_form_bloc.dart';

@freezed
class CategoryFormEvent with _$CategoryFormEvent {
  const factory CategoryFormEvent.started() = _Started;
  const factory CategoryFormEvent.formSubmitted({
    required String name,
    String? description,
  }) = _FormSubmitted;
}
