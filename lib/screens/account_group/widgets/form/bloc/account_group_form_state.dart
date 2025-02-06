part of 'account_group_form_bloc.dart';

@freezed
class AccountGroupFormState with _$AccountGroupFormState {
  const factory AccountGroupFormState({
    AccountGroup? savedAccountGroup,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _AccountGroupFormState;
}
