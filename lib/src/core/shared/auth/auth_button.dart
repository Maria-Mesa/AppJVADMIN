import 'package:flutter/material.dart';
import 'package:helloworld/src/core/constants/constants.dart';

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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: Constants.innerBorderRadius,
        boxShadow: Constants.boxShadow,
      ),
      child: GestureDetector(
        onTap: onTap,
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
