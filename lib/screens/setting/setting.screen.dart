import 'package:flutter/material.dart';

import '../../routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            ElevatedButton(onPressed: () => AccountGroupRoute().push(context), child: Text("Account Groups")),
            ElevatedButton(onPressed: () => ExpenseCategoryRoute().push(context), child: Text("Expense Categories")),
            ElevatedButton(onPressed: () => IncomeCategoryRoute().push(context), child: Text("Income Categories")),
            ElevatedButton(onPressed: () => CurrencyRoute().push(context), child: Text("Currencies")),
          ],
        ),
      ),
    );
  }
}
