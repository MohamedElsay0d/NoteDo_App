import 'package:flutter/material.dart';

class MyCustomElevatedButton extends StatefulWidget {
  const MyCustomElevatedButton({
    super.key,
    required this.onPresssed,
    required this.label,
    this.btnColor = Colors.green,
  });

  final Function() onPresssed;
  final String label;
  final Color btnColor;

  @override
  State<MyCustomElevatedButton> createState() => _MyCustomElevatedButtonState();
}

class _MyCustomElevatedButtonState extends State<MyCustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPresssed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: SizedBox(
        width: 60,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
