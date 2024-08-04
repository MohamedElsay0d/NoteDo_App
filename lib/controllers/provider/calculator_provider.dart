import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider with ChangeNotifier {
  final textFieldContent = TextEditingController();
  String resultLabel = '';

  void setValue(String value) {
    String str = textFieldContent.text;

    switch (value) {
      case 'C':
        textFieldContent.clear();
        resultLabel = '';
        break;
      case '÷':
        textFieldContent.text += '/';
        break;
      case '×':
        textFieldContent.text += '*';
        break;
      case 'AC':
        if (str.isNotEmpty) {
          textFieldContent.text = str.substring(0, str.length - 1);
          resultLabel = '';
        }
        break;

      case '=':
        compute();
        break;
      default:
        textFieldContent.text += value;
    }

    notifyListeners(); // Notify listeners after modifying data
  }

  void compute() {
    String expression = textFieldContent.text;

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();

      double result = exp.evaluate(EvaluationType.REAL, cm);

      resultLabel = result.toString(); // Update the result label variable
    } catch (e) {
      resultLabel = 'mathimatic error ..';
    }

    notifyListeners(); // Notify listeners after modifying data
  }

  @override
  void dispose() {
    super.dispose();
    textFieldContent.dispose();
  }
}
