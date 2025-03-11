import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
          scheduleAdded: (event) async => await _onScheduleAdded(event, emit),
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

      List<TimeOfDay> schedules = [];
      if (status == true) {
        await appNotificationLogic.requestPermissions();
        schedules = await appNotificationLogic.getSchedules();

        if (schedules.isEmpty) {
          final defaultSchedules = [TimeOfDay(hour: 12, minute: 30), TimeOfDay(hour: 21, minute: 00)];
          await appNotificationLogic.setSchedules(defaultSchedules);
          schedules = await appNotificationLogic.getSchedules();
        }
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

      List<TimeOfDay> schedules = [];
      if (newStatus) {
        await appNotificationLogic.requestPermissions();

        schedules = await appNotificationLogic.getSchedules();
        if (schedules.isEmpty) {
          final defaultSchedules = [TimeOfDay(hour: 12, minute: 30), TimeOfDay(hour: 21, minute: 00)];
          await appNotificationLogic.setSchedules(defaultSchedules);
          schedules = await appNotificationLogic.getSchedules();
        }
      } else {
        await appNotificationLogic.clearSchedules();
      }

      await appNotificationLogic.setPermissionStatus(newStatus);
      emit(state.copyWith(status: newStatus, schedules: schedules));
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
