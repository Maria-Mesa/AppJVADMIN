import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.label,
    this.labelColor = Colors.white,
    this.onTap,
    super.key,
  });
  final VoidCallback? onTap;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: Constants.innerBorderRadius,
          boxShadow: Constants.boxShadow,
        ),
        child: Padding(
          padding: Constants.contentPadding,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: labelColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
