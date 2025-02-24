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
          (el) => DropdownMenuEntry<TimeRange>(value: el, label: el.displayName),
        )
        .toList();

    return DropdownMenu<TimeRange>(
      initialSelection: selected,
      dropdownMenuEntries: items,
      onSelected: onSelected,
      inputDecorationTheme: Theme.of(context).dropdownMenuTheme.inputDecorationTheme?.copyWith(
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
    );
  }
}
