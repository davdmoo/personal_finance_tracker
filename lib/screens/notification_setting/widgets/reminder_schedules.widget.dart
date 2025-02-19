import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app.constant.dart';
import '../../../extensions/time_of_day.extension.dart';
import '../bloc/notification_setting_bloc.dart';

class ReminderScheduleWidget extends StatelessWidget {
  const ReminderScheduleWidget({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationSettingBloc, NotificationSettingState>(
      buildWhen: (previous, current) => previous.schedules != current.schedules,
      builder: (context, state) {
        final schedules = state.schedules;

        return Visibility(
          visible: status,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Divider(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Reminder Schedules",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FilledButton.icon(
                      onPressed: schedules.length >= AppConstant.maxScheduledNotifs
                          ? null
                          : () async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                                initialEntryMode: TimePickerEntryMode.input,
                              );
                              if (time == null || !context.mounted) return;

                              final event = NotificationSettingEvent.scheduleAdded(time);
                              context.read<NotificationSettingBloc>().add(event);
                            },
                      icon: Icon(Icons.add, size: 20),
                      label: Text("Add"),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < schedules.length; i++)
                    Builder(
                      builder: (context) {
                        final schedule = schedules[i];

                        return ListTile(
                          title: Text(schedule.timeDisplay),
                          trailing: IconButton(
                            onPressed: () {
                              final event = NotificationSettingEvent.scheduleRemoved(schedule);
                              context.read<NotificationSettingBloc>().add(event);
                            },
                            icon: Icon(Icons.close, size: 16),
                            padding: EdgeInsets.zero,
                          ),
                          onTap: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                              initialEntryMode: TimePickerEntryMode.input,
                            );
                            if (time == null || !context.mounted) return;

                            final event = NotificationSettingEvent.scheduleChanged(
                              index: i,
                              value: time,
                            );
                            context.read<NotificationSettingBloc>().add(event);
                          },
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
