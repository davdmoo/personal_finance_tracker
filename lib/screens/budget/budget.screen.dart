import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../logics/budget.logic.dart';
import 'bloc/budget_bloc.dart';
import 'form/budget_form.widget.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetBloc(context.read<BudgetLogic>())..add(BudgetEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Budgets")),
        body: BlocBuilder<BudgetBloc, BudgetState>(
          buildWhen: (previous, current) => previous.budgets != current.budgets,
          builder: (context, state) {
            final budgets = state.budgets;

            if (budgets.isEmpty) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your budgets is empty.", style: TextStyle(fontSize: 16)),
                    TextButton(
                      child: Text("Add a budget here"),
                      onPressed: () async {
                        final result = await showDialog<Budget>(
                          context: context,
                          builder: (context) => BudgetFormDialog(),
                        );
                        if (result == null || !context.mounted) return;

                        context.read<BudgetBloc>().add(BudgetEvent.started());
                      },
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                final item = budgets[index];
                final budget = item.budget.budget;
                final category = item.budget.category;

                double progressValue = item.usedAmount / budget.amount;
                if (progressValue >= 1.0) {
                  progressValue = 1.0;
                }

                return ListTile(
                  key: Key(budget.id.toString()),
                  subtitle: Row(
                    spacing: 16,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(category.name, style: TextStyle(fontSize: 16)),
                          Text(budget.amount.toString()),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinearProgressIndicator(
                              value: progressValue,
                              color: progressValue == 1.0 ? Colors.red : null,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.usedAmount.toString()),
                                Text(budget.amount.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () async {
                    final result = await showDialog<Budget>(
                      context: context,
                      builder: (context) => BudgetFormDialog(budget: budget),
                    );
                    if (result == null || !context.mounted) return;

                    context.read<BudgetBloc>().add(BudgetEvent.started());
                  },
                );
              },
              itemCount: budgets.length,
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              final result = await showDialog<Budget>(
                context: context,
                builder: (context) => BudgetFormDialog(),
              );
              if (result == null || !context.mounted) return;

              context.read<BudgetBloc>().add(BudgetEvent.started());
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
