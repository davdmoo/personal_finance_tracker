import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/time_range.enum.dart';
import '../../../extensions/double.extension.dart';
import '../../../models/categorized_expense.model.dart';
import '../bloc/summary_bloc.dart';
import 'summary_header.widget.dart';

typedef _SummaryStateSelector = ({
  double totalIncome,
  double totalExpense,
  List<CategorizedExpense> topSpendingsByCategory,
  TimeRange timeRange,
});

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<SummaryBloc, SummaryState, _SummaryStateSelector>(
      selector: (state) => (
        totalIncome: state.totalIncome,
        totalExpense: state.totalExpense,
        topSpendingsByCategory: state.topSpendingsByCategory,
        timeRange: state.timeRange,
      ),
      builder: (context, state) {
        final totalIncome = state.totalIncome.currency;
        final totalExpense = state.totalExpense.currency;
        final topSpendingsByCategory = state.topSpendingsByCategory;

        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummaryHeaderWidget(),
            SizedBox(height: 8),
            Row(
              spacing: 4,
              children: [
                Expanded(child: Text("Total Income", style: textTheme.labelLarge)),
                Text(totalIncome),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Expanded(child: Text("Total Expense", style: textTheme.labelLarge)),
                Text(totalExpense),
              ],
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Spendings", style: textTheme.labelLarge),
                if (topSpendingsByCategory.isEmpty)
                  Text("No transactions yet")
                else
                  for (final el in topSpendingsByCategory)
                    Row(
                      spacing: 4,
                      children: [
                        Expanded(
                          child: Text(
                            "- ${el.expenseCategory.name} (${DoubleExt.getPercentage(el.totalAmount, state.totalExpense)})",
                          ),
                        ),
                        Text(el.totalAmount.currency),
                      ],
                    )
              ],
            ),
          ],
        );
      },
    );
  }
}
