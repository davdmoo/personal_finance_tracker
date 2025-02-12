import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../../../extensions/double.extension.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/dashboard_bloc.dart';
import 'chart_header.widget.dart';

class CategorizedExpenseWidget extends StatelessWidget {
  const CategorizedExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.categorizedExpenses != current.categorizedExpenses,
      builder: (context, state) {
        final categorizedExpenses = state.categorizedExpenses;

        if (categorizedExpenses.isEmpty) {
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your transaction is empty.", style: TextStyle(fontSize: 16)),
                TextButton(
                  child: Text("Add a transaction here"),
                  onPressed: () async {
                    final result = await TransactionFormRoute(tab: TransactionFormTab.expense).push<Object>(context);
                    if (result == null || !context.mounted) return;

                    if (result is Expense || result is Transfer || result is Income) {
                      context.read<DashboardBloc>().add(DashboardEvent.started());
                    }
                  },
                ),
              ],
            ),
          );
        }

        final chartSectionData = categorizedExpenses.map((el) {
          final percentage = el.getPercentage(state.totalExpense);

          return PieChartSectionData(
            title: percentage,
            value: el.totalAmount,
            radius: 80,
            titleStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          );
        }).toList();

        return Column(
          children: [
            ChartHeaderWidget(),
            Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: PieChart(
                PieChartData(
                  sections: chartSectionData,
                  centerSpaceRadius: 0,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categorizedExpenses.length,
                itemBuilder: (context, index) {
                  final item = categorizedExpenses[index];
                  final percentage = item.getPercentage(state.totalExpense);

                  return ListTile(
                    title: Text(item.expenseCategory.name),
                    leading: Text(percentage),
                    trailing: Text(item.totalAmount.currency),
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
