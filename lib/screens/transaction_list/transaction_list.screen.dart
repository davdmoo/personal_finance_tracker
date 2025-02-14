import 'package:flutter/material.dart';

import '../summary/summary.screen.dart';
import 'widgets/transaction_list.widget.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transaction List"),
          bottom: TabBar(tabs: [Tab(text: "Transactions"), Tab(text: "Summary")]),
        ),
        body: TabBarView(
          children: [TransactionListWidget(), SummaryScreen()],
        ),
      ),
    );
  }
}
