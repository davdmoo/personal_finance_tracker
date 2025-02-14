import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logics/expense.logic.dart';
import '../../logics/income.logic.dart';
import 'bloc/summary_bloc.dart';
import 'widgets/summary.widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummaryBloc(
        expenseLogic: context.read<ExpenseLogic>(),
        incomeLogic: context.read<IncomeLogic>(),
      )..add(SummaryEvent.started()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                SummaryWidget(),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
