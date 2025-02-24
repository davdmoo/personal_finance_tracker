import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';

class EmptyTransactionListWidget extends StatelessWidget {
  const EmptyTransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}
