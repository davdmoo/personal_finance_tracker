import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'database_provider.dart';
import 'logics/account.logic.dart';
import 'logics/account_group.logic.dart';
import 'logics/app_notification.logic.dart';
import 'logics/backup.logic.dart';
import 'logics/budget.logic.dart';
import 'logics/create_excel.logic.dart';
import 'logics/currency.logic.dart';
import 'logics/default_currency.logic.dart';
import 'logics/expense.logic.dart';
import 'logics/expense_category.logic.dart';
import 'logics/income.logic.dart';
import 'logics/income_category.logic.dart';
import 'logics/transfer.logic.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  tz.initializeTimeZones();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DatabaseProvider()),
        RepositoryProvider(create: (context) => AccountLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => AccountGroupLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => IncomeCategoryLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => CurrencyLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => ExpenseCategoryLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => IncomeCategoryLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => ExpenseLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => IncomeLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => TransferLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(create: (context) => BudgetLogic(context.read<DatabaseProvider>())),
        RepositoryProvider(
          create: (context) => CreateExcelLogic(
            expenseLogic: context.read<ExpenseLogic>(),
            incomeLogic: context.read<IncomeLogic>(),
            transferLogic: context.read<TransferLogic>(),
          ),
        ),
        RepositoryProvider(create: (context) => DefaultCurrencyLogic()),
        RepositoryProvider(create: (context) => AppNotification()),
        RepositoryProvider(create: (context) => BackupLogic(context.read<DatabaseProvider>())),
      ],
      child: const FinanceTracker(),
    ),
  );
}

class FinanceTracker extends StatelessWidget {
  const FinanceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finance Tracker App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale("en", "US"),
      supportedLocales: const [Locale("en", "US"), Locale("id", "ID")],
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 12),
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      routerConfig: router,
    );
  }
}
