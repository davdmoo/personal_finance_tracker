part of 'account_group_bloc.dart';

@freezed
class AccountGroupEvent with _$AccountGroupEvent {
  const factory AccountGroupEvent.started() = _Started;
  const factory AccountGroupEvent.reordered({
    required int oldIndex,
    required int newIndex,
  }) = _Reordered;
}
