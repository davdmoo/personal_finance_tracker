import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logics/app_notification.logic.dart';
import 'bloc/notification_setting_bloc.dart';
import 'widgets/reminder_schedules.widget.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationSettingBloc(
        context.read<AppNotification>(),
      )..add(NotificationSettingEvent.started()),
      child: BlocListener<NotificationSettingBloc, NotificationSettingState>(
        listenWhen: (previous, current) => previous.error != current.error && current.error != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Dismiss", onPressed: () => ScaffoldMessenger.of(context).clearSnackBars()),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Notifications")),
          body: BlocBuilder<NotificationSettingBloc, NotificationSettingState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              final status = state.status;

              return SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    SwitchListTile(
                      title: Text("Allow notifications"),
                      value: status,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      onChanged: (value) {
                        context.read<NotificationSettingBloc>().add(NotificationSettingEvent.notificationSwitched());
                      },
                    ),
                    ReminderScheduleWidget(status: status),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
