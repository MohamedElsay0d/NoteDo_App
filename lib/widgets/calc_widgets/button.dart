import 'package:flutter/material.dart';
import 'package:notedo_app/controllers/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.textColor = Colors.white,
  });

  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<CalculatorProvider>(context, listen: false)
          .setValue(label),
      child: Material(
        elevation: 3,
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
