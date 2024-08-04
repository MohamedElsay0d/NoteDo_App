import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: TextField(
        controller: controller,
        readOnly: true,
        showCursor: true,
        autofocus: true,
        style: const TextStyle(fontSize: 50),
        decoration: const InputDecoration(
          border: InputBorder.none,
          // filled: true,
        ),
        // enabled: false,
      ),
    );
  }
}
