import 'package:flutter/material.dart';
import 'package:helloworld/src/core/routes/app_routes.dart';
import 'package:helloworld/src/theme/theme.dart';

class JVAdminApp extends StatefulWidget {
  const JVAdminApp({super.key});

  @override
  State<JVAdminApp> createState() => _JVAdminAppState();
}

class _JVAdminAppState extends State<JVAdminApp> {
  late final AppRoutes _appRoutes;

  @override
  void initState() {
    super.initState();
    _appRoutes = AppRoutes();
    AppLightTheme.initialize(context);
    AppDarkTheme.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp.router(
        title: 'JV ADMIN',
        theme: AppLightTheme.instance,
        darkTheme: AppDarkTheme.instance,
        themeMode: ThemeMode.light,
        routerConfig: _appRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
