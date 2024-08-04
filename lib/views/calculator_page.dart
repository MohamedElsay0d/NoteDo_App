import 'package:flutter/material.dart';
import 'package:notedo_app/controllers/provider/calculator_provider.dart';
import 'package:notedo_app/widgets/calc_widgets/buttons_container.dart';
import 'package:notedo_app/widgets/calc_widgets/textfield.dart';
import 'package:provider/provider.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, calcProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('NoteDo Calculator'),
            centerTitle: true,
            // backgroundColor: AppColors.primaryColor,
          ),
          // backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                controller: calcProvider.textFieldContent,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  calcProvider.resultLabel,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.grey
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 40),
              const ButtonsContainer(),
            ],
          ),
        );
      },
    );
  }
}
