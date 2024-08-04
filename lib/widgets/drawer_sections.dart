import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:notedo_app/views/calculator_page.dart';
import 'package:notedo_app/views/notes_screen.dart';
import 'package:notedo_app/views/todo_screen.dart';
import 'package:notedo_app/views/translator_page.dart';

class Sections extends StatelessWidget {
  const Sections({
    super.key,
    required this.listLength,
    required this.listOfContent,
    this.router,
  });

  final int listLength;
  final List listOfContent;

  final Widget? router;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: List.generate(
          listLength,
          (index) => GestureDetector(
            onTap: () {
              Get.back(); // Close the drawer

              Get.to(() {
                // Check the text of the tapped item
                final String text = listOfContent[index]['text'];
                if (text == 'Notes') {
                  return NotesScreen(
                    // isWhiteMode: isWhiteMode,
                    hasAppBar: true,
                    title: 'Your Notes',
                  );
                } else if (text == 'Todos') {
                  return TodoScreen(
                    hasAppBar: true,
                    title: 'Your Todos List',
                    // isWhiteMode: isWhiteMode,
                  );
                } else if (text == 'Calculator') {
                  // Handle other cases, if needed
                  return const CalcScreen();
                } else if (text == 'Translate') {
                  // Handle other cases, if needed
                  return TranslatorScreen();
                } else {
                  // Return a default widget or widget function
                  return Container(); // Example default widget
                }
              }, duration: Duration(milliseconds: 1000));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: listOfContent[index]['color'],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            listOfContent[index]['icon'],
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        listOfContent[index]['text'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    FontAwesome.caret_right,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
