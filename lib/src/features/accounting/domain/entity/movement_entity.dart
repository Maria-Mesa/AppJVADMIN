import 'package:flutter/material.dart';

enum MovementType {
  income(
    name: 'Ingreso',
    background: Colors.black,
    stringColor: Colors.white,
    amountColor: Colors.green,
  ),
  expense(
    name: 'Gasto',
    background: Color.fromARGB(45, 0, 0, 0),
    stringColor: Colors.black,
    amountColor: Colors.red,
  );

  const MovementType({
    required this.name,
    required this.background,
    required this.stringColor,
    required this.amountColor,
  });

  final String name;
  final Color background;
  final Color stringColor;
  final Color amountColor;
}

class MovementEntity {
  MovementEntity({
    required this.type,
    required this.detail,
    required this.date,
    required this.amount,
  });
  final MovementType type;
  final String detail;
  final String date;
  final double amount;
}
