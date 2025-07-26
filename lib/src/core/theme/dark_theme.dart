import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';

class AppDarkTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('AppTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createDarkTheme(context);
  }

  static ThemeData _createDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Questrial',
      primaryColor: Constants.primaryColor,
      pageTransitionsTheme: Constants.pageTransition,
    );
  }
}
