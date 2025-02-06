part of 'account_group_form_bloc.dart';

@freezed
class AccountGroupFormEvent with _$AccountGroupFormEvent {
  const factory AccountGroupFormEvent.started() = _Started;
  const factory AccountGroupFormEvent.formSubmitted({required String name}) = _FormSubmitted;
}
