import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'database.dart';
import 'screens/account/account.screen.dart';
import 'screens/account_group/account_group.screen.dart';
import 'screens/category/category.screen.dart';
import 'screens/currency/currency.screen.dart';
import 'screens/home/home.screen.dart';
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

  const TransactionFormRoute({this.$extra});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: TransactionFormScreen(
        populatedExpense: $extra?.populatedExpense,
        populatedIncome: $extra?.populatedIncome,
        populatedTransfer: $extra?.populatedTransfer,
      ),
    );
  }
}

@TypedGoRoute<CategoryRoute>(path: CategoryRoute.path, name: CategoryRoute.name)
@immutable
class CategoryRoute extends GoRouteData {
  static const path = "/categories", name = "categories";

  const CategoryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: CategoryScreen());
  }
}

@TypedGoRoute<AccountGroupRoute>(path: AccountGroupRoute.path, name: AccountGroupRoute.name)
@immutable
class AccountGroupRoute extends GoRouteData {
  static const path = "/account-groups", name = "account-groups";

  const AccountGroupRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: AccountGroupScreen());
  }
}

@TypedGoRoute<AccountRoute>(path: AccountRoute.path, name: AccountRoute.name)
@immutable
class AccountRoute extends GoRouteData {
  static const path = "/accounts", name = "accounts";

  const AccountRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: AccountScreen());
  }
}

@TypedGoRoute<CurrencyRoute>(path: CurrencyRoute.path, name: CurrencyRoute.name)
@immutable
class CurrencyRoute extends GoRouteData {
  static const path = "/currencies", name = "currencies";

  const CurrencyRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: CurrencyScreen());
  }
}
