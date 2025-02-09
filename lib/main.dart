import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database.dart';
import 'logics/account.logic.dart';
import 'logics/account_group.logic.dart';
import 'logics/currency.logic.dart';
import 'logics/expense.logic.dart';
import 'logics/expense_category.logic.dart';
import 'logics/income.logic.dart';
import 'logics/income_category.logic.dart';
import 'logics/transfer.logic.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      routerConfig: router,
    );
  }
}
