import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color.fromARGB(255, 255, 59, 59);
  static const Color secondaryColor = Color(0xFFffffff);

  static const double defaultPadding = 8.0;
  static const double defaultBorderRadius = 16.0;
  static const EdgeInsets mainPadding = EdgeInsets.all(defaultPadding);
  static const EdgeInsets contentPadding = EdgeInsets.all(defaultPadding * 2);

  static BorderRadius mainBorderRadius = BorderRadius.circular(
    defaultBorderRadius,
  );
  static BorderRadius innerBorderRadius = BorderRadius.circular(
    defaultBorderRadius - defaultPadding,
  );

  static Duration animationTransition = const Duration(milliseconds: 350);

  static PageTransitionsTheme pageTransition = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static List<BoxShadow> boxShadow = <BoxShadow>[
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 46, 0.15),
      offset: Offset(0, 48),
      blurRadius: 100,
      spreadRadius: 0,
    ),
  ];
}
