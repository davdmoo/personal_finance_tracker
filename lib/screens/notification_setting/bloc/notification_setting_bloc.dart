import 'dart:async';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/app.constant.dart';
import '../../../logics/app_notification.logic.dart';

part 'notification_setting_bloc.freezed.dart';
part 'notification_setting_event.dart';
part 'notification_setting_state.dart';

class NotificationSettingBloc extends Bloc<NotificationSettingEvent, NotificationSettingState> {
  final AppNotification appNotificationLogic;

  NotificationSettingBloc(this.appNotificationLogic) : super(_NotificationSettingState()) {
    on<NotificationSettingEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          notificationSwitched: (event) async => await _onNotificationSwitched(event, emit),
          scheduleAdded: (event) => _onScheduleAdded(event, emit),
          scheduleRemoved: (event) async => await _onScheduleRemoved(event, emit),
          scheduleChanged: (event) async => await _onScheduleChanged(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<NotificationSettingState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final status = await appNotificationLogic.getPermissionStatus();
      List<TimeOfDay> schedules = await appNotificationLogic.getSchedules();
      if (schedules.isEmpty) {
        final defaultSchedules = [TimeOfDay(hour: 12, minute: 30), TimeOfDay(hour: 21, minute: 00)];
        await appNotificationLogic.setSchedules(defaultSchedules);
        schedules = await appNotificationLogic.getSchedules();
      }

      emit(state.copyWith(status: status ?? false, schedules: schedules));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onNotificationSwitched(_NotificationSwitched event, Emitter<NotificationSettingState> emit) async {
    try {
      final newStatus = !state.status;

      if (newStatus) {
        final notifPermission = await Permission.notification.request();
        if (notifPermission.isPermanentlyDenied) {
          if (defaultTargetPlatform == TargetPlatform.android) {
            final packageInfo = await PackageInfo.fromPlatform();

            final intent = AndroidIntent(
              action: "android.settings.APP_NOTIFICATION_SETTINGS",
              flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
              arguments: {
                'android.provider.extra.APP_PACKAGE': packageInfo.packageName,
              },
            );

            await intent.launch();
          }
        }

        if (!notifPermission.isGranted) {
          throw Exception("You have to allow notifications first");
        }

        final exactAlarmPermission = await Permission.scheduleExactAlarm.request();
        if (exactAlarmPermission.isDenied || exactAlarmPermission.isPermanentlyDenied) {
          if (defaultTargetPlatform == TargetPlatform.android) {
            await AndroidFlutterLocalNotificationsPlugin().requestExactAlarmsPermission();
          }
        }

        if (!exactAlarmPermission.isGranted) {
          throw Exception("You have to allow the permission first");
        }
      }

      await appNotificationLogic.setPermissionStatus(newStatus);
      emit(state.copyWith(status: newStatus));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onScheduleAdded(_ScheduleAdded event, Emitter<NotificationSettingState> emit) async {
    try {
      final schedules = [...state.schedules];
      if (schedules.length >= AppConstant.maxScheduledNotifs) return;
      if (schedules.contains(event.value)) return;

      schedules.add(event.value);
      schedules.sort();

      await appNotificationLogic.setSchedules(schedules);

      emit(state.copyWith(schedules: schedules));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    }
  }

  Future<void> _onScheduleRemoved(_ScheduleRemoved event, Emitter<NotificationSettingState> emit) async {
    try {
      final schedules = [...state.schedules];
      schedules.remove(event.value);
      schedules.sort();

      await appNotificationLogic.setSchedules(schedules);

      emit(state.copyWith(schedules: schedules));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    }
  }

  Future<void> _onScheduleChanged(_ScheduleChanged event, Emitter<NotificationSettingState> emit) async {
    try {
      final schedules = [...state.schedules];
      if (schedules.contains(event.value)) return;

      schedules.removeAt(event.index);
      schedules.add(event.value);
      schedules.sort();

      await appNotificationLogic.setSchedules(schedules);

      emit(state.copyWith(schedules: schedules));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    }
  }
}
