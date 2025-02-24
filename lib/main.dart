import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'database.dart';
import 'logics/account.logic.dart';
import 'logics/account_group.logic.dart';
import 'logics/app_notification.logic.dart';
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
        RepositoryProvider(
          create: (context) => AppDatabase(),
        ),
        RepositoryProvider(
          create: (context) => AccountLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => AccountGroupLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => IncomeCategoryLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => CurrencyLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => ExpenseCategoryLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => IncomeCategoryLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => ExpenseLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => IncomeLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => TransferLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => BudgetLogic(context.read<AppDatabase>()),
        ),
        RepositoryProvider(
          create: (context) => CreateExcelLogic(
            expenseLogic: context.read<ExpenseLogic>(),
            incomeLogic: context.read<IncomeLogic>(),
            transferLogic: context.read<TransferLogic>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => DefaultCurrencyLogic(),
        ),
        RepositoryProvider(
          create: (context) => AppNotification(),
        ),
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
      ),
      routerConfig: router,
    );
  }
}
