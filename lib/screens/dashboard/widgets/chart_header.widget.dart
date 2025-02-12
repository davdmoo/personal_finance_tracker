import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/time_range.enum.dart';
import '../../../extensions/date_time.extensions.dart';
import '../../../extensions/date_time_range.extension.dart';
import '../bloc/dashboard_bloc.dart';
import 'time_range_dropdown.widget.dart';

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
            children: [
              Expanded(child: Text(dateTimeRange.displayNameFromTimeRange(timeRange))),
              TimeRangeDropdown(
                selected: timeRange,
                onSelected: (value) {
                  if (value == null) return;

                  context.read<DashboardBloc>().add(DashboardEvent.timeRangeChanged(value));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
