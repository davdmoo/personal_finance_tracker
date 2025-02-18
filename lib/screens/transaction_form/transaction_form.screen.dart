import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../database.dart';
import '../../logics/account.logic.dart';
import '../../logics/currency.logic.dart';
import '../../logics/default_currency.logic.dart';
import '../../logics/expense.logic.dart';
import '../../logics/expense_category.logic.dart';
import '../../logics/income.logic.dart';
import '../../logics/income_category.logic.dart';
import '../../logics/transfer.logic.dart';
import 'bloc/transaction_form_bloc.dart';
import 'widgets/expense_form.widget.dart';
import 'widgets/income_form.widget.dart';
import 'widgets/transfer_form.widget.dart';

enum TransactionFormTab {
  expense,
  income,
  transfer;
}

class TransactionFormScreen extends StatelessWidget {
  const TransactionFormScreen({
    super.key,
    required this.tab,
    this.populatedExpense,
    this.populatedIncome,
    this.populatedTransfer,
  });

  final TransactionFormTab tab;
  final PopulatedExpense? populatedExpense;
  final PopulatedIncome? populatedIncome;
  final PopulatedTransfer? populatedTransfer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionFormBloc(
        populatedExpense: populatedExpense,
        populatedIncome: populatedIncome,
        populatedTransfer: populatedTransfer,
        expenseLogic: context.read<ExpenseLogic>(),
        incomeLogic: context.read<IncomeLogic>(),
        transferLogic: context.read<TransferLogic>(),
        accountLogic: context.read<AccountLogic>(),
        currencyLogic: context.read<CurrencyLogic>(),
        expenseCategoryLogic: context.read<ExpenseCategoryLogic>(),
        incomeCategoryLogic: context.read<IncomeCategoryLogic>(),
        defaultCurrencyLogic: context.read<DefaultCurrencyLogic>(),
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
        child: DefaultTabController(
          length: 3,
          initialIndex: selectedIndex,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Transaction Form"),
              bottom: const TabBar(
                tabs: [Tab(text: "Expense"), Tab(text: "Income"), Tab(text: "Transfer")],
              ),
            ),
            body: TabBarView(
              children: [
                ExpenseFormWidget(populatedExpense: populatedExpense),
                IncomeFormWidget(populatedIncome: populatedIncome),
                TransferFormWidget(populatedTransfer: populatedTransfer),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int get selectedIndex {
    return tab.index;
  }
}
