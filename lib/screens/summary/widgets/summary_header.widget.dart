import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/time_range.enum.dart';
import '../../../extensions/date_time.extensions.dart';
import '../../../extensions/date_time_range.extension.dart';
import '../../../widgets/time_range_dropdown.widget.dart';
import '../bloc/summary_bloc.dart';

typedef _SummaryHeaderSelector = ({
  TimeRange timeRange,
  DateTimeRange? dateTimeRange,
});

class SummaryHeaderWidget extends StatelessWidget {
  const SummaryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SummaryBloc, SummaryState, _SummaryHeaderSelector>(
      selector: (state) => (timeRange: state.timeRange, dateTimeRange: state.dateTimeRange),
      builder: (context, state) {
        final timeRange = state.timeRange;

        final defaultStart = DateTime.now().startOfDay;
        final defaultEnd = DateTime.now();
        final dateTimeRange = state.dateTimeRange ?? DateTimeRange(start: defaultStart, end: defaultEnd);

        return Row(
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

                context.read<SummaryBloc>().add(SummaryEvent.customDateRangeSelected(result));
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

                  context.read<SummaryBloc>().add(SummaryEvent.customDateRangeSelected(result));
                } else {
                  context.read<SummaryBloc>().add(SummaryEvent.timeRangeChanged(value));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
