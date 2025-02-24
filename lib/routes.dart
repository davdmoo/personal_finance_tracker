import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'database.dart';
import 'screens/account/account.screen.dart';
import 'screens/account_group/account_group.screen.dart';
import 'screens/budget/budget.screen.dart';
import 'screens/dashboard/dashboard.screen.dart';
import 'screens/expense_category/expense_category.screen.dart';
import 'screens/home/home.screen.dart';
import 'screens/income_category/income_category.screen.dart';
import 'screens/notification_setting/notification_setting.screen.dart';
import 'screens/splash/splash.screen.dart';
import 'screens/transaction_form/transaction_form.screen.dart';

part "routes.g.dart";

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: SplashRoute.path,
);

@TypedGoRoute<SplashRoute>(path: SplashRoute.path, name: SplashRoute.name)
@immutable
class SplashRoute extends GoRouteData {
  static const path = "/", name = "splash";

  const SplashRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SplashScreen());
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, name: HomeRoute.name)
@immutable
class HomeRoute extends GoRouteData {
  static const path = "/home", name = "home";

  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomeScreen());
  }
}

class TransactionFormRouteExtra {
  final PopulatedExpense? populatedExpense;
  final PopulatedIncome? populatedIncome;
  final PopulatedTransfer? populatedTransfer;
  const TransactionFormRouteExtra({this.populatedExpense, this.populatedIncome, this.populatedTransfer});
}

@TypedGoRoute<TransactionFormRoute>(path: TransactionFormRoute.path, name: TransactionFormRoute.name)
@immutable
class TransactionFormRoute extends GoRouteData {
  static const path = "/transactions", name = "transactions";

  final TransactionFormRouteExtra? $extra;
  final TransactionFormTab tab;

  const TransactionFormRoute({this.$extra, required this.tab});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: TransactionFormScreen(
        tab: tab,
        populatedExpense: $extra?.populatedExpense,
        populatedIncome: $extra?.populatedIncome,
        populatedTransfer: $extra?.populatedTransfer,
      ),
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<ExpenseCategoryRoute>(path: ExpenseCategoryRoute.path, name: ExpenseCategoryRoute.name)
@immutable
class ExpenseCategoryRoute extends GoRouteData {
  static const path = "/expense-categories", name = "expense-categories";

  const ExpenseCategoryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: ExpenseCategoryScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<IncomeCategoryRoute>(path: IncomeCategoryRoute.path, name: IncomeCategoryRoute.name)
@immutable
class IncomeCategoryRoute extends GoRouteData {
  static const path = "/income-categories", name = "income-categories";

  const IncomeCategoryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: IncomeCategoryScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<AccountGroupRoute>(path: AccountGroupRoute.path, name: AccountGroupRoute.name)
@immutable
class AccountGroupRoute extends GoRouteData {
  static const path = "/account-groups", name = "account-groups";

  const AccountGroupRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: AccountGroupScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<AccountRoute>(path: AccountRoute.path, name: AccountRoute.name)
@immutable
class AccountRoute extends GoRouteData {
  static const path = "/accounts", name = "accounts";

  const AccountRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: AccountScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<CurrencyRoute>(path: CurrencyRoute.path, name: CurrencyRoute.name)
@immutable
class CurrencyRoute extends GoRouteData {
  static const path = "/currencies", name = "currencies";

  const CurrencyRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: AccountScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<BudgetRoute>(path: BudgetRoute.path, name: BudgetRoute.name)
@immutable
class BudgetRoute extends GoRouteData {
  static const path = "/budgets", name = "budgets";

  const BudgetRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: BudgetScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<DashboardRoute>(path: DashboardRoute.path, name: DashboardRoute.name)
@immutable
class DashboardRoute extends GoRouteData {
  static const path = "/dashboard", name = "dashboard";

  const DashboardRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: DashboardScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}

@TypedGoRoute<NotificationSettingRoute>(path: NotificationSettingRoute.path, name: NotificationSettingRoute.name)
@immutable
class NotificationSettingRoute extends GoRouteData {
  static const path = "/notifications", name = "notifications";

  const NotificationSettingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: NotificationSettingScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(position: position, child: child);
      },
    );
  }
}
