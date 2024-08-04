import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:notedo_app/widgets/custom_button.dart';

class AddTodoTaskDialog extends StatelessWidget {
  const AddTodoTaskDialog({
    super.key,
    required this.onSave,
    required this.mycontroller,
  });

  final VoidCallback onSave;


  final TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Ionicons.ios_add_circle, size: 50, color: Colors.green),
      title: const Text(
        'Add Todo Task',
        style: TextStyle(color: Colors.green, fontSize: 20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: mycontroller,
            
            decoration: InputDecoration(
              hintText: 'Enter Task',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyCustomElevatedButton(
                onPresssed: () => Navigator.pop(context),
                label: 'Cancle',
                btnColor: Colors.red,
              ),
              MyCustomElevatedButton(
                onPresssed: onSave,
                label: 'Done',
              ),
            ],
          )
        ],
      ),
    );
  }
}
