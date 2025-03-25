import 'package:flutter/material.dart';

import '../enums/time_range.enum.dart';

class TimeRangeDropdown extends StatelessWidget {
  const TimeRangeDropdown({super.key, required this.onSelected, required this.selected});

  final void Function(TimeRange? value) onSelected;
  final TimeRange selected;

  @override
  Widget build(BuildContext context) {
    final items = TimeRange.values
        .map(
          (el) => PopupMenuItem<TimeRange>(value: el, child: Text(el.displayName)),
        )
        .toList();

    return FilledButton(
      onPressed: () async {
        final result = await showMenu<TimeRange>(
          context: context,
          position: RelativeRect.fromDirectional(
            textDirection: TextDirection.ltr,
            start: double.maxFinite,
            top: 120,
            end: 0,
            bottom: 0,
          ),
          items: items,
        );
        if (result == null) return;

        onSelected(result);
      },
      style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16))),
      child: Row(
        spacing: 4,
        children: [
          Text(selected.displayName),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
