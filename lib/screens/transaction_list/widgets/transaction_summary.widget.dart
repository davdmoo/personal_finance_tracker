import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/double.extension.dart';
import '../bloc/transaction_list_bloc.dart';

typedef _TransactionSummarySelector = ({
  double totalIncome,
  double totalExpense,
});

class TransactionSummaryWidget extends StatelessWidget {
  const TransactionSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocSelector<TransactionListBloc, TransactionListState, _TransactionSummarySelector>(
        selector: (state) => (totalIncome: state.totalIncome, totalExpense: state.totalExpense),
        builder: (context, state) => Row(
          spacing: 8,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Income", style: TextStyle(fontSize: 14)),
                  Text(state.totalIncome.currency, style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Expense", style: TextStyle(fontSize: 14)),
                  Text(state.totalExpense.currency, style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
