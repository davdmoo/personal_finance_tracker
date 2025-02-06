part of 'account_group_bloc.dart';

@freezed
class AccountGroupState with _$AccountGroupState {
  const factory AccountGroupState({
    @Default([]) List<AccountGroup> accountGroups,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _AccountGroupState;
}
