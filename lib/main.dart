import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    RepositoryProvider(
      create: (context) => AppDatabase(),
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
