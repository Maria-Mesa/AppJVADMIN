import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';
import 'package:jvadmin/src/features/accounting/domain/entity/movement_entity.dart';
import 'package:jvadmin/src/features/accounting/presentation/widget/billing_container.dart';
import 'package:jvadmin/src/features/accounting/presentation/widget/recent_movements.dart';

class AccountingPage extends StatefulWidget {
  const AccountingPage({super.key});

  @override
  State<AccountingPage> createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage> {
  final List<MovementEntity> movements = <MovementEntity>[
    MovementEntity(
      type: MovementType.income,
      detail: 'Venta de productos',
      date: 'Hoy',
      amount: 25000,
    ),
    MovementEntity(
      type: MovementType.expense,
      detail: 'Compra de suministros',
      date: 'Hoy',
      amount: 58000,
    ),

    MovementEntity(
      type: MovementType.income,
      detail: 'Venta de productos',
      date: 'Hoy',
      amount: 25000,
    ),
    MovementEntity(
      type: MovementType.expense,
      detail: 'Compra de suministros',
      date: 'Ayer',
      amount: 35600,
    ),
    MovementEntity(
      type: MovementType.expense,
      detail: 'Venta de productos',
      date: 'Hoy',
      amount: 18000,
    ),
    MovementEntity(
      type: MovementType.income,
      detail: 'Compra de suministros',
      date: 'Ayer',
      amount: 756000,
    ),
  ];

  void _addMovement() {
    final DateTime today = DateTime.now();
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime randomDate = DateTime(
      today.year,
      today.month,
      Random().nextBool() ? today.day : yesterday.day,
    );

    //random movement type
    final MovementType randomType = Random().nextBool()
        ? MovementType.income
        : MovementType.expense;

    //random amount
    final int randomAmount = Random().nextInt(10000) + 1000;

    final MovementEntity newMovement = MovementEntity(
      type: randomType,
      detail: 'Nuevo movimiento',
      date: randomDate == today ? 'Hoy' : 'Ayer',
      amount: randomAmount.toDouble(),
    );

    setState(() {
      movements.add(newMovement);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: Constants.contentPadding,
        children: <Widget>[
          const Text(
            'Contabilidad',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Constants.defaultPadding),
          const BillingContainer(),
          const SizedBox(height: Constants.defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Movimientos recientes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              GestureDetector(
                onTap: _addMovement,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: Constants.mainBorderRadius,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: Constants.contentPadding / 2,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.add, size: 14, color: Colors.black54),
                        Text('Registrar'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Constants.defaultPadding),
          ...movements.map((MovementEntity movement) {
            return MovementTile(movement: movement);
          }),
        ],
      ),
    );
  }
}
