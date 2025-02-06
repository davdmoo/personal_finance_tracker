part of 'account_form_bloc.dart';

@freezed
class AccountFormState with _$AccountFormState {
  const factory AccountFormState({
    Account? savedAccount,
    @Default([]) List<AccountGroup> accountGroups,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _AccountFormState;
}
