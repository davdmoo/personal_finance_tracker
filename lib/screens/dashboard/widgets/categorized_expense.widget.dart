import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';

class CategorizedExpenseWidget extends StatelessWidget {
  const CategorizedExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.categorizedExpenses != current.categorizedExpenses,
      builder: (context, state) {
        final categorizedExpenses = state.categorizedExpenses;
        final chartSectionData = categorizedExpenses.map((el) {
          return PieChartSectionData(
            title: el.expenseCategory.name,
            value: el.totalAmount,
          );
        }).toList();

        return Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: PieChart(
                PieChartData(sections: chartSectionData),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categorizedExpenses.length,
                itemBuilder: (context, index) {
                  final item = categorizedExpenses[index];
                  final percentage = "${(item.getPercentage(state.totalExpense) * 100).toInt()}%";

                  return ListTile(
                    title: Text(item.expenseCategory.name),
                    leading: Text(percentage),
                    trailing: Text(item.totalAmount.toString()),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
