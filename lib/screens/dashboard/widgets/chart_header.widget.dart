import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/time_range.enum.dart';
import '../../../extensions/date_time.extensions.dart';
import '../../../extensions/date_time_range.extension.dart';
import '../../../widgets/time_range_dropdown.widget.dart';
import '../bloc/dashboard_bloc.dart';

typedef _ChartHeaderSelector = ({
  TimeRange timeRange,
  DateTimeRange? dateTimeRange,
});

class ChartHeaderWidget extends StatelessWidget {
  const ChartHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardBloc, DashboardState, _ChartHeaderSelector>(
      selector: (state) => (timeRange: state.timeRange, dateTimeRange: state.dateTimeRange),
      builder: (context, state) {
        final timeRange = state.timeRange;

        final defaultStart = DateTime.now().startOfDay;
        final defaultEnd = DateTime.now();
        final dateTimeRange = state.dateTimeRange ?? DateTimeRange(start: defaultStart, end: defaultEnd);

        return Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    dateTimeRange.displayNameFromTimeRange(timeRange, state.dateTimeRange),
                    style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () async {
                  final result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                    lastDate: DateTime.now().add(Duration(days: 365 * 100)),
                  );
                  if (result == null || !context.mounted) return;

                  context.read<DashboardBloc>().add(DashboardEvent.customDateRangeSelected(result));
                },
              ),
              TimeRangeDropdown(
                selected: timeRange,
                onSelected: (value) async {
                  if (value == null) return;

                  if (value == TimeRange.custom) {
                    final result = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                      lastDate: DateTime.now().add(Duration(days: 365 * 100)),
                    );
                    if (result == null || !context.mounted) return;

                    context.read<DashboardBloc>().add(DashboardEvent.customDateRangeSelected(result));
                  } else {
                    context.read<DashboardBloc>().add(DashboardEvent.timeRangeChanged(value));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
