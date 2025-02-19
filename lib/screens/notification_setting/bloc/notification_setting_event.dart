part of 'notification_setting_bloc.dart';

@freezed
class NotificationSettingEvent with _$NotificationSettingEvent {
  const factory NotificationSettingEvent.started() = _Started;
  const factory NotificationSettingEvent.notificationSwitched() = _NotificationSwitched;
  const factory NotificationSettingEvent.scheduleRemoved(TimeOfDay value) = _ScheduleRemoved;
  const factory NotificationSettingEvent.scheduleAdded(TimeOfDay value) = _ScheduleAdded;
  const factory NotificationSettingEvent.scheduleChanged({
    required int index,
    required TimeOfDay value,
  }) = _ScheduleChanged;
}
