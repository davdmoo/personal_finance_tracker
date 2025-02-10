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

            return ListView.builder(
              itemBuilder: (context, index) {
                final item = budgets[index];
                final budget = item.budget;

                return ListTile(
                  key: Key(budget.id.toString()),
                  title: Text(item.category.name),
                  subtitle: Text("Budget: ${budget.amount}"),
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
