import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helloworld/src/features/accounting/presentation/page/accounting_page.dart';
import 'package:helloworld/src/features/home/presentation/page/home.dart';
import 'package:helloworld/src/features/login/presentation/page/login.dart';
import 'package:helloworld/src/features/signup/presentation/page/signup.dart';

class AppRoutes {
  late final GoRouter router = GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) => const Login(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) => const Home(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (BuildContext context, GoRouterState state) => const Signup(),
      ),
      GoRoute(
        path: '/accounting',
        name: 'accounting',
        builder: (BuildContext context, GoRouterState state) =>
            const AccountingPage(),
      ),
    ],
  );
}
