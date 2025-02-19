import 'dart:convert';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../extensions/time_of_day.extension.dart';
import '../models/zoned_schedule_body.model.dart';

class AppNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static const allowNotificationKey = "allowNotifications";
  static const scheduleKey = "schedules";

  Future<void> init() async {
    const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final androidDetails = AndroidNotificationDetails(
      packageInfo.packageName, // must be unique
      'Finance Tracker',
      importance: Importance.high,
      priority: Priority.high,
      icon: "@mipmap/launcher_icon",
      silent: false,
      playSound: true,
      enableVibration: true,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }

  Future<List<ActiveNotification>> getActiveNotifications() async {
    return await _notificationsPlugin.getActiveNotifications();
  }

  Future<void> scheduleNotification(List<NotificationSchedule> schedules) async {
    final androidDetails = AndroidNotificationDetails(
      "daily_reminder_id",
      'Daily Reminder',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      icon: "@mipmap/launcher_icon",
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.cancelAll();

    for (final schedule in schedules) {
      final now = DateTime.now();
      final scheduledTime = DateTime(now.year, now.month, now.day, schedule.time.hour, schedule.time.minute);
      final scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);

      await _notificationsPlugin.zonedSchedule(
        schedule.id,
        schedule.title,
        schedule.body,
        scheduledDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time, // ensures it repeats daily
      );
    }
  }

  Future<bool?> getPermissionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(allowNotificationKey);
  }

  Future<void> setPermissionStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(allowNotificationKey, value);
  }

  Future<List<TimeOfDay>> getSchedules() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(scheduleKey);
    if (jsonList == null) return [];

    return jsonList.map(
      (json) {
        final decoded = jsonDecode(json);
        final hour = decoded["hour"];
        final minute = decoded["minute"];

        return TimeOfDay(hour: hour, minute: minute);
      },
    ).toList();
  }

  Future<void> setSchedules(List<TimeOfDay> value) async {
    final prefs = await SharedPreferences.getInstance();

    final List<NotificationSchedule> schedules = [];
    for (int i = 0; i < value.length; i++) {
      final time = value[i];
      final id = i + 1;

      schedules.add(
        NotificationSchedule(
          id: id,
          title: "Daily reminder",
          body: "Have you recorded your transactions yet?",
          time: time,
        ),
      );
    }

    await scheduleNotification(schedules);
    await prefs.setStringList(scheduleKey, value.map((el) => el.toJson()).toList());
  }

  Future<void> clearSchedules() async {
    return await _notificationsPlugin.cancelAll();
  }

  Future<void> requestPermissions() async {
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
}
