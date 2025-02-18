part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.started() = _Started;
  const factory AccountEvent.reordered({
    required int oldIndex,
    required int newIndex,
  }) = _Reordered;
}
