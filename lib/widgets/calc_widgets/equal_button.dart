import 'package:flutter/material.dart';
import 'package:notedo_app/controllers/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

class EqualButton extends StatelessWidget {
  const EqualButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CalculatorProvider>(context, listen: false).compute();
      },
      child: Container(
        height: 160,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const Center(
          child: Text(
            '=',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
