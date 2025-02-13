import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/transfer.logic.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';

class _TransactionListSelectorState {
  final List<PopulatedExpense> expenses;
  final List<PopulatedIncome> incomes;
  final List<PopulatedTransfer> transfers;

  const _TransactionListSelectorState({required this.expenses, required this.incomes, required this.transfers});
}

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionListBloc(
        expenseLogic: context.read<ExpenseLogic>(),
        incomeLogic: context.read<IncomeLogic>(),
        transferLogic: context.read<TransferLogic>(),
      )..add(TransactionListEvent.started()),
      child: Scaffold(
        body: BlocSelector<TransactionListBloc, TransactionListState, _TransactionListSelectorState>(
          selector: (state) => _TransactionListSelectorState(
            expenses: state.expenses,
            incomes: state.incomes,
            transfers: state.transfers,
          ),
          builder: (context, state) {
            final expenses = state.expenses;
            final incomes = state.incomes;
            final transfers = state.transfers;

            final data = [...expenses, ...incomes, ...transfers];
            if (data.isEmpty) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your transaction is empty.", style: TextStyle(fontSize: 16)),
                    TextButton(
                      child: Text("Add a transaction here"),
                      onPressed: () async {
                        final result = await TransactionFormRoute(
                          tab: TransactionFormTab.expense,
                        ).push<Object>(context);
                        if (result == null || !context.mounted) return;

                        if (result is Expense || result is Transfer || result is Income) {
                          context.read<TransactionListBloc>().add(TransactionListEvent.started());
                        }
                      },
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 0),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];

                if (item is PopulatedExpense) {
                  return ListTile(
                    title: Text(item.expense.note),
                    subtitle: Text(item.expense.transactionDate.toLocal().toIso8601String()),
                    trailing: Text(item.expense.amount.toString()),
                    onTap: () async {
                      final result = await TransactionFormRoute(
                        tab: TransactionFormTab.expense,
                        $extra: TransactionFormRouteExtra(populatedExpense: item),
                      ).push(context);
                      if (result == null || !context.mounted || result == false) return;

                      context.read<TransactionListBloc>().add(TransactionListEvent.started());
                    },
                  );
                }

                if (item is PopulatedIncome) {
                  return ListTile(
                    title: Text(item.income.note),
                    subtitle: Text(item.income.transactionDate.toLocal().toIso8601String()),
                    trailing: Text(item.income.amount.toString()),
                    onTap: () async {
                      final result = await TransactionFormRoute(
                        $extra: TransactionFormRouteExtra(populatedIncome: item),
                        tab: TransactionFormTab.income,
                      ).push(context);
                      if (result == null || !context.mounted || result == false) return;

                      context.read<TransactionListBloc>().add(TransactionListEvent.started());
                    },
                  );
                }

                if (item is PopulatedTransfer) {
                  return ListTile(
                    title: Text(item.transfer.note),
                    subtitle: Text(item.transfer.transactionDate.toLocal().toIso8601String()),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(item.transfer.amount.toString()),
                        Text("Fee: ${item.transfer.fee.toString()}", style: TextStyle(fontSize: 11)),
                      ],
                    ),
                    onTap: () async {
                      final result = await TransactionFormRoute(
                        tab: TransactionFormTab.transfer,
                        $extra: TransactionFormRouteExtra(populatedTransfer: item),
                      ).push(context);
                      if (result == null || !context.mounted || result == false) return;

                      context.read<TransactionListBloc>().add(TransactionListEvent.started());
                    },
                  );
                }

                return SizedBox.shrink();
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              final result = await TransactionFormRoute(tab: TransactionFormTab.expense).push<Object>(context);
              if (result == null || !context.mounted) return;

              if (result is Expense || result is Transfer || result is Income) {
                context.read<TransactionListBloc>().add(TransactionListEvent.started());
              }
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
