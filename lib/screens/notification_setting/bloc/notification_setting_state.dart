part of 'notification_setting_bloc.dart';

@freezed
class NotificationSettingState with _$NotificationSettingState {
  const factory NotificationSettingState({
    @Default([]) List<TimeOfDay> schedules,
    @Default(false) bool status,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _NotificationSettingState;
}
