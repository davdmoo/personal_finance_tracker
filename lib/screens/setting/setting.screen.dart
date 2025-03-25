import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/app_bloc.dart';
import '../../extensions/theme_mode.extension.dart';
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
      "Monthly Budgets": () => BudgetRoute().push(context),
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
      "Theme": null,
    };

    return Listener(
      onPointerDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: ListView.separated(
          itemCount: routes.length,
          itemBuilder: (BuildContext context, int index) {
            final route = routes.entries.elementAt(index);
            final isTheme = route.key == "Theme";

            return ListTile(
              title: Text(route.key),
              onTap: route.value,
              trailing: isTheme
                  ? BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) => previous.theme != current.theme,
                      builder: (context, state) => DropdownButton<ThemeMode>(
                        padding: null,
                        underline: SizedBox.shrink(),
                        value: state.theme,
                        items: ThemeMode.values
                            .map(
                              (theme) => DropdownMenuItem(
                                value: theme,
                                child: Text(theme.displayName),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          context.read<AppBloc>().add(AppEvent.themeToggled(value));
                        },
                      ),
                    )
                  : Icon(Icons.chevron_right),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
        ),
      ),
    );
  }
}
