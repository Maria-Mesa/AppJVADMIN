import 'package:flutter/material.dart';
import 'package:helloworld/src/core/constants/constants.dart';

class AppLightTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('AppTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createLightTheme(context);
  }

  static ThemeData _createLightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Questrial',
      primaryColor: Constants.primaryColor,
      pageTransitionsTheme: Constants.pageTransition,
      colorScheme: const ColorScheme.light(
        primary: Constants.primaryColor,
        secondary: Constants.secondaryColor,
        error: Constants.primaryColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        // ignore: deprecated_member_use
        year2023: false,
        color: Constants.primaryColor,
        linearTrackColor: Constants.secondaryColor,
        trackGap: Constants.defaultPadding,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Constants.primaryColor,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
