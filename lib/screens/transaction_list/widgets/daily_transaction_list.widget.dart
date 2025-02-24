import 'package:flutter/material.dart';

import '../../../database.dart';
import '../../../extensions/date_time.extensions.dart';
import '../../../extensions/double.extension.dart';
import 'expense_item.widget.dart';
import 'income_item.widget.dart';
import 'transfer_item.wiget.dart';

class DailyTransactionListWidget extends StatelessWidget {
  const DailyTransactionListWidget({super.key, required this.transaction});

  final MapEntry<DateTime, List<Object>> transaction;

  double get totalDailyIncome {
    double amount = 0;

    for (final item in transaction.value) {
      if (item is PopulatedIncome) {
        amount += item.income.amount;
      }
    }

    return amount;
  }

  double get totalDailyExpense {
    double amount = 0;

    for (final item in transaction.value) {
      if (item is PopulatedExpense) {
        amount += item.expense.amount;
      }
    }

    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                child: Text(
                  transaction.key.dateLocaleId,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_down, size: 14, color: Colors.blue),
                  Text(totalDailyIncome.currency, style: TextStyle(fontSize: 12, color: Colors.blue)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_drop_up, size: 14, color: Colors.red),
                  Text(totalDailyExpense.currency, style: TextStyle(fontSize: 12, color: Colors.red)),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 0),
        Builder(
          builder: (context) {
            final transactions = transaction.value;

            final List<Widget> widgets = [];
            for (final item in transactions) {
              if (item is PopulatedExpense) {
                widgets.add(ExpenseItemWidget(item: item));
              }

              if (item is PopulatedIncome) {
                widgets.add(IncomeItemWidget(item: item));
              }

              if (item is PopulatedTransfer) {
                widgets.add(TransferItemWidget(item: item));
              }
            }

            return Column(children: [...widgets]);
          },
        ),
      ],
    );
  }
}
