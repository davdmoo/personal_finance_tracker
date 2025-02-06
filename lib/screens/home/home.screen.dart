import 'package:flutter/material.dart';

import '../account/account.screen.dart';
import '../setting/setting.screen.dart';
import '../transaction_list/transaction_list.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        TransactionListScreen(),
        AccountScreen(),
        SettingScreen(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet), label: "Accounts"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
