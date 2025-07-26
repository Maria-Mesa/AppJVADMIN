import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jvadmin/src/core/constants/constants.dart';
import 'package:jvadmin/src/features/accounting/presentation/widget/billing.dart';

class BillingContainer extends StatelessWidget {
  const BillingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
        minWidth: 300,
        maxHeight: 280,
        minHeight: 200,
      ),
      child: const Column(
        spacing: Constants.defaultPadding,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: Constants.defaultPadding,
              children: <Widget>[
                Expanded(
                  child: Billing(
                    icon: Icons.trending_up_rounded,
                    elementColor: Colors.green,
                    label: 'Ingresos',
                    value: 2450000,
                  ),
                ),
                Expanded(
                  child: Billing(
                    icon: Icons.trending_down_rounded,
                    elementColor: Colors.red,
                    label: 'Egresos',
                    value: 1200000,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Billing(
              icon: HugeIcons.strokeRoundedCalculator,
              elementColor: Colors.black,
              label: 'Balance',
              value: 1250000,
            ),
          ),
        ],
      ),
    );
  }
}
