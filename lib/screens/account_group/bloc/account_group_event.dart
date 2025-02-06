part of 'account_group_bloc.dart';

@freezed
class AccountGroupEvent with _$AccountGroupEvent {
  const factory AccountGroupEvent.started() = _Started;
}