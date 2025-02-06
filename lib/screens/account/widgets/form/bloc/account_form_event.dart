part of 'account_form_bloc.dart';

@freezed
class AccountFormEvent with _$AccountFormEvent {
  const factory AccountFormEvent.started() = _Started;
  const factory AccountFormEvent.formSubmitted({
    required String name,
    required AccountGroup accountGroup,
  }) = _FormSubmitted;
}
