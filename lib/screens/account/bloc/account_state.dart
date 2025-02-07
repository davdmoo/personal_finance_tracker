part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default([]) List<AccountBalance> accounts,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _AccountState;
}
