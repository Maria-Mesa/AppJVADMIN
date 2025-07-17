import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';
import 'package:jvadmin/src/core/extension/currency_extension.dart';

class Billing extends StatelessWidget {
  const Billing({
    required this.icon,
    required this.elementColor,
    required this.label,
    required this.value,
    super.key,
  });
  final Color elementColor;
  final IconData icon;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: Constants.mainBorderRadius,
        border: Border.all(color: elementColor.withValues(alpha: .2)),
        color: elementColor.withValues(alpha: .1),
      ),
      child: Column(
        spacing: Constants.defaultPadding,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: elementColor, size: 28),
          Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                color: elementColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              value.formatCurrency(),
              style: TextStyle(
                color: elementColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
