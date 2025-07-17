import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';
import 'package:jvadmin/src/core/extension/currency_extension.dart';
import 'package:jvadmin/src/features/accounting/domain/entity/movement_entity.dart';

class MovementTile extends StatefulWidget {
  const MovementTile({required this.movement, super.key});
  final MovementEntity movement;

  @override
  State<MovementTile> createState() => _MovementTileState();
}

class _MovementTileState extends State<MovementTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Constants.defaultPadding),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: Constants.mainBorderRadius,
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: Constants.contentPadding,
          child: Row(
            spacing: Constants.defaultPadding,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 76,
                      child: Column(
                        spacing: Constants.defaultPadding,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: widget.movement.type.background,
                              borderRadius: Constants.mainBorderRadius,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.defaultPadding * 1.7,
                                vertical: Constants.defaultPadding / 2,
                              ),
                              child: Text(
                                widget.movement.type.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.movement.type.stringColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.movement.date,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.movement.detail,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              _movementValue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movementValue() {
    final String formattedAmount = widget.movement.amount.formatCurrency();
    return Text(
      widget.movement.type == MovementType.income
          ? '+ $formattedAmount'
          : '- $formattedAmount',
      style: TextStyle(
        color: widget.movement.type.amountColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
