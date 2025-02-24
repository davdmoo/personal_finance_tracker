import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../database.dart';
import '../../../extensions/double.extension.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';

class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget({super.key, required this.item});

  final PopulatedExpense item;

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16),
      subtitle: Row(
        spacing: 8,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              item.category?.name ?? "-",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.expense.note.isEmpty ? "-" : item.expense.note),
              Text(item.account?.name ?? "-"),
            ],
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          Text(
            item.expense.amount.currency,
            style: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.normal),
          ),
          PopupMenuButton(
            padding: EdgeInsets.zero,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Delete"),
                onTap: () async {
                  final result = await _showDeleteConfirmationDialog(context);
                  if (result == null || !result || !context.mounted) return;

                  context.read<TransactionListBloc>().add(TransactionListEvent.expenseDeleted(item.expense.id));
                },
              )
            ],
          ),
        ],
      ),
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
}
