import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../database.dart';
import '../../../extensions/double.extension.dart';
import '../../../routes.dart';
import '../../transaction_form/transaction_form.screen.dart';
import '../bloc/transaction_list_bloc.dart';

class TransferItemWidget extends StatelessWidget {
  const TransferItemWidget({super.key, required this.item});

  final PopulatedTransfer item;

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
            child: Text("Transfer", style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(
              "${item.accountOrigin?.name} -> ${item.accountDestination?.name}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item.transfer.amount.currency),
              PopupMenuButton(
                padding: EdgeInsets.zero,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Delete"),
                    onTap: () async {
                      final result = await _showDeleteConfirmationDialog(context);
                      if (result == null || !result || !context.mounted) return;

                      context.read<TransactionListBloc>().add(TransactionListEvent.transferDeleted(item.transfer.id));
                    },
                  )
                ],
              ),
            ],
          ),
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
}
