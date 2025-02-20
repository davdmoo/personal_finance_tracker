import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/transfer.logic.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';
import 'expense_item.widget.dart';
import 'income_item.widget.dart';
import 'transfer_item.wiget.dart';

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

                if (item is PopulatedExpense) return ExpenseItemWidget(item: item);
                if (item is PopulatedIncome) return IncomeItemWidget(item: item);
                if (item is PopulatedTransfer) return TransferItemWidget(item: item);

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
