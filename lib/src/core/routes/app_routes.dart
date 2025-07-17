import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jvadmin/src/features/accounting/presentation/page/accounting_page.dart';
import 'package:jvadmin/src/features/dashboard/presentation/page/dashboard.dart';
import 'package:jvadmin/src/features/inventory/presentation/page/inventory.dart';
import 'package:jvadmin/src/features/login/presentation/page/login.dart';
import 'package:jvadmin/src/features/providers/presentation/page/providers.dart';
import 'package:jvadmin/src/features/sales/presentation/page/sales.dart';
import 'package:jvadmin/src/features/shell/presentation/shell.dart';
import 'package:jvadmin/src/features/signup/presentation/page/signup.dart';

class AppRoutes {
  final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  final GlobalKey<StatefulNavigationShellState> shellBranchNavigatorKey =
      GlobalKey<StatefulNavigationShellState>();
  late final GoRouter router = GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    navigatorKey: rootKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) => const Login(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (BuildContext context, GoRouterState state) => const Signup(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootKey,
        key: shellBranchNavigatorKey,
        builder: (_, _, StatefulNavigationShell navigationShell) =>
            Shell(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage<DashboardPage>(
                      child: DashboardPage(),
                    ),
              ),
              GoRoute(
                path: '/inventory',
                name: 'inventory',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage<Inventory>(child: Inventory()),
              ),
              GoRoute(
                path: '/sales',
                name: 'sales',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage<Sales>(child: Sales()),
              ),
              GoRoute(
                path: '/providers',
                name: 'providers',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage<Providers>(child: Providers()),
              ),
              GoRoute(
                path: '/accounting',
                name: 'accounting',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage<AccountingPage>(
                      child: AccountingPage(),
                    ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/* 
  final List<Widget> pages = <Widget>[
    const DashboardPage(),
    const Inventory(),
    const Sales(),
    const ProveedoresPage(),
    const AccountingPage(),
  ];


 */
