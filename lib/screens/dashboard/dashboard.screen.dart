import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logics/expense.logic.dart';
import '../../logics/income.logic.dart';
import 'bloc/dashboard_bloc.dart';
import 'widgets/categorized_expense.widget.dart';
import 'widgets/categorized_income.widget.dart';
import 'widgets/expense_trend_bar_chart.widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        expenseLogic: context.read<ExpenseLogic>(),
        incomeLogic: context.read<IncomeLogic>(),
      )..add(DashboardEvent.started()),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
            bottom: TabBar(tabs: [Tab(text: "Expense"), Tab(text: "Income"), Tab(text: "Trend")]),
          ),
          body: TabBarView(
            children: [CategorizedExpenseWidget(), CategorizedIncomeWidget(), ExpenseTrendBarChartWidget()],
          ),
        ),
      ),
    );
  }
}
