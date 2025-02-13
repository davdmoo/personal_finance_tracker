import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/summary_bloc.dart';

class MonthlyTotalExpenseWidget extends StatelessWidget {
  const MonthlyTotalExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SummaryBloc, SummaryState>(
      buildWhen: (previous, current) => previous.monthlyTotalExpenses != current.monthlyTotalExpenses,
      builder: (context, state) {
        return Column(
          spacing: 8,
          children: [
            Text("Monthly Expenses", style: textTheme.labelLarge),
            SizedBox(height: 200, child: BarChart(BarChartData())),
          ],
        );
      },
    );
  }
}
