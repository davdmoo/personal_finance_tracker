import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../enums/time_range.enum.dart';
import '../bloc/summary_bloc.dart';

class ExportExcelButton extends StatelessWidget {
  const ExportExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, SummaryState>(
      buildWhen: (previous, current) => previous.isExporting != current.isExporting,
      builder: (context, state) {
        final isExporting = state.isExporting;

        return FilledButton(
          onPressed: isExporting
              ? null
              : () async {
                  final result = await showDialog<TimeRange>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Choose a time range"),
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      content: Column(
                        spacing: 8,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final el in TimeRange.values)
                            ListTile(title: Text(el.displayName), onTap: () => context.pop(el)),
                        ],
                      ),
                    ),
                  );
                  if (result == null || !context.mounted) return;

                  DateTimeRange dateRange = result.dateRange;
                  // show date range picker if custom
                  if (result == TimeRange.custom) {
                    final pickedDateRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDateRange == null || !context.mounted) return;

                    dateRange = pickedDateRange;
                  }

                  final event = SummaryEvent.downloadExcelTriggered(
                    timeRange: TimeRange.custom,
                    dateRange: dateRange,
                  );
                  context.read<SummaryBloc>().add(event);
                },
          child: Text(isExporting ? "Exporting.." : "Export to Excel"),
        );
      },
    );
  }
}
