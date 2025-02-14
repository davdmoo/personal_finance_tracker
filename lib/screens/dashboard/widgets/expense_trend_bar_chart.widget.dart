import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/monthly_expense.model.dart';
import '../bloc/dashboard_bloc.dart';

typedef _ExpenseTrendSelector = ({
  List<MonthlyExpense> monthlyTotalExpenses,
  List<BarChartGroupData> barChartGroupData,
  double highestMonthlyExpense,
});

class ExpenseTrendBarChartWidget extends StatelessWidget {
  const ExpenseTrendBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<DashboardBloc, DashboardState, _ExpenseTrendSelector>(
      selector: (state) => (
        monthlyTotalExpenses: state.monthlyTotalExpenses,
        barChartGroupData: state.barChartGroupData,
        highestMonthlyExpense: state.highestMonthlyExpense
      ),
      builder: (context, state) {
        final monthlyTotalExpenses = state.monthlyTotalExpenses;
        final barChartGroupData = state.barChartGroupData;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              Text("Monthly Expenses", style: textTheme.labelLarge),
              SizedBox(
                height: 300,
                child: Builder(
                  builder: (context) {
                    if (monthlyTotalExpenses.isEmpty) {
                      return Center(child: Text("No transactions yet."));
                    }

                    return BarChart(
                      BarChartData(
                        barGroups: barChartGroupData,
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                final data = monthlyTotalExpenses[value.toInt()];
                                final yearString = data.year.toString();
                                final monthString = data.month.toString().padLeft(2, "0");

                                return SideTitleWidget(
                                  meta: meta,
                                  space: 8,
                                  child: Text(
                                    "$monthString/${yearString[yearString.length - 2]}${yearString[yearString.length - 1]}",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
