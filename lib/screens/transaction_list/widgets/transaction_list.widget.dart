import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../../../enums/time_range.enum.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/transfer.logic.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';
import 'daily_transaction_list.widget.dart';
import 'empty_transaction_list.widget.dart';
import 'transaction_list_header.widget.dart';
import 'transaction_summary.widget.dart';

class _TransactionListSelectorState {
  final Map<DateTime, List<Object>> allTransactions;
  final TimeRange timeRange;
  final DateTimeRange? dateTimeRange;

  const _TransactionListSelectorState({
    required this.allTransactions,
    required this.timeRange,
    this.dateTimeRange,
  });
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
            allTransactions: state.allTransactions,
            timeRange: state.timeRange,
            dateTimeRange: state.customDateRange,
          ),
          builder: (context, state) {
            final timeRange = state.timeRange;
            final dateTimeRange = state.dateTimeRange ?? timeRange.dateRange;

            final data = state.allTransactions;
            return Column(
              spacing: 8,
              children: [
                TransactionListHeaderWidget(dateTimeRange: dateTimeRange, timeRange: timeRange),
                TransactionSummaryWidget(),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (data.isEmpty) return EmptyTransactionListWidget();

                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => DailyTransactionListWidget(
                          transaction: data.entries.elementAt(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
