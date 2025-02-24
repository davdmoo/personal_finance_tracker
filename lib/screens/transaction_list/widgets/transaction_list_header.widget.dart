import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/time_range.enum.dart';
import '../../../extensions/date_time_range.extension.dart';
import '../../../widgets/time_range_dropdown.widget.dart';
import '../bloc/transaction_list_bloc.dart';

class TransactionListHeaderWidget extends StatelessWidget {
  const TransactionListHeaderWidget({super.key, required this.dateTimeRange, required this.timeRange});

  final TimeRange timeRange;
  final DateTimeRange dateTimeRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                dateTimeRange.displayNameFromTimeRange(timeRange, dateTimeRange),
                style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            onTap: () async {
              final result = await showDateRangePicker(
                context: context,
                firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                lastDate: DateTime.now().add(Duration(days: 365 * 100)),
              );
              if (result == null || !context.mounted) return;

              final event = TransactionListEvent.timeRangeChanged(
                value: TimeRange.custom,
                customDateRange: result,
              );
              context.read<TransactionListBloc>().add(event);
            },
          ),
          TimeRangeDropdown(
            onSelected: (value) async {
              if (value == null) return;

              if (value == TimeRange.custom) {
                final result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                  lastDate: DateTime.now().add(Duration(days: 365 * 100)),
                );
                if (result == null || !context.mounted) return;

                final event = TransactionListEvent.timeRangeChanged(value: value, customDateRange: result);
                context.read<TransactionListBloc>().add(event);
              } else {
                final event = TransactionListEvent.timeRangeChanged(value: value);
                context.read<TransactionListBloc>().add(event);
              }
            },
            selected: timeRange,
          ),
        ],
      ),
    );
  }
}
