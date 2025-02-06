import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../database.dart';
import 'bloc/transaction_form_bloc.dart';
import 'widgets/expense_form.widget.dart';
import 'widgets/income_form.widget.dart';
import 'widgets/transfer_form.widget.dart';

class TransactionFormScreen extends StatelessWidget {
  const TransactionFormScreen({super.key, this.populatedExpense, this.populatedIncome, this.populatedTransfer});

  final PopulatedExpense? populatedExpense;
  final PopulatedIncome? populatedIncome;
  final PopulatedTransfer? populatedTransfer;

  @override
  Widget build(BuildContext context) {
    final db = context.read<AppDatabase>();

    return BlocProvider(
      create: (context) => TransactionFormBloc(
        db: db,
        populatedExpense: populatedExpense,
        populatedIncome: populatedIncome,
        populatedTransfer: populatedTransfer,
      )..add(TransactionFormEvent.started()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<TransactionFormBloc, TransactionFormState>(
            listenWhen: (previous, current) => previous.savedExpense != current.savedExpense,
            listener: (context, state) {
              final savedExpense = state.savedExpense;
              if (savedExpense == null) return;

              context.pop(savedExpense);
            },
          ),
          BlocListener<TransactionFormBloc, TransactionFormState>(
            listenWhen: (previous, current) => previous.savedIncome != current.savedIncome,
            listener: (context, state) {
              final savedIncome = state.savedIncome;
              if (savedIncome == null) return;

              context.pop(savedIncome);
            },
          ),
          BlocListener<TransactionFormBloc, TransactionFormState>(
            listenWhen: (previous, current) => previous.savedTransfer != current.savedTransfer,
            listener: (context, state) {
              final savedTransfer = state.savedTransfer;
              if (savedTransfer == null) return;

              context.pop(savedTransfer);
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: Text("Transaction Form")),
          body: DefaultTabController(
            length: 3,
            initialIndex: selectedIndex,
            child: Column(
              children: [
                const TabBar(
                  tabs: [Tab(text: "Expense"), Tab(text: "Income"), Tab(text: "Transfer")],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ExpenseFormWidget(populatedExpense: populatedExpense),
                      IncomeFormWidget(populatedIncome: populatedIncome),
                      TransferFormWidget(populatedTransfer: populatedTransfer),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int get selectedIndex {
    if (populatedTransfer != null) return 2;
    if (populatedIncome != null) return 1;
    return 0;
  }
}
