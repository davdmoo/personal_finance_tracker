import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;

    final Map<String, VoidCallback?> routes = {
      "Account Groups": () => AccountGroupRoute().push(context),
      "Accounts": () => AccountRoute().push(context),
      "Expense Categories": () => ExpenseCategoryRoute().push(context),
      "Income Categories": () => IncomeCategoryRoute().push(context),
      "Budgets": () => BudgetRoute().push(context),
      "Backups & Exports": () => BackupRoute().push(context),
      "App Notifications": isAndroid
          ? () => NotificationSettingRoute().push(context)
          : () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Currently only available on Android"),
                  actions: [TextButton(onPressed: () => context.pop(false), child: Text("Close"))],
                ),
              );
            },
    };

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView.separated(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          final route = routes.entries.elementAt(index);
          return ListTile(
            title: Text(route.key),
            onTap: route.value,
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
      ),
    );
  }
}
