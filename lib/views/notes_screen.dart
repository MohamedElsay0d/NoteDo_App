import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:notedo_app/controllers/getx/note_controller.dart';
import 'package:notedo_app/views/edit_note_screen.dart';
import 'package:notedo_app/widgets/custom_button.dart';
import 'package:notedo_app/widgets/item_siidable.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    Key? key,
    this.hasAppBar = false,
    this.title = '',
  }) : super(key: key);

  final String title;
  final bool hasAppBar;

  @override
  Widget build(BuildContext context) {
    final NotesController controller =
        Get.put<NotesController>(NotesController());

    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              backgroundColor: Colors.transparent,
              title: Text(title),
            )
          : null,
      body: Obx(() {
        return ListView.separated(
          key: const PageStorageKey('notes'),
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 120,
            left: 20,
            right: 20,
          ),
          itemCount: controller.notesList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 6,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async {
              final noteContent = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return EditNoteScreen(
                    noteCardModel: controller.notesList[index],
                  );
                }),
              );
              if (noteContent != null) {
                controller.deleteNote(controller.notesList[index].id);
                int originalIndex =
                    controller.notesList.indexOf(controller.notesList[index]);
                controller.notesList.removeAt(originalIndex);

                if (noteContent != null && noteContent[0] != '' ||
                    noteContent[1] != '') {
                  await controller.addNote(
                    noteContent[0],
                    noteContent[1],
                    DateTime.now(),
                    true,
                  );
                }
              }
            },
            child: NoteAndTodoItemCardSlidable(
              noteTitle: controller.notesList[index].title,
              noteContent: controller.notesList[index].content,
              hasContent: controller.notesList[index].isCompleted,
              date: controller.notesList[index].date,
              deleteNoteMethod: (context) => deleteNoteMethod(index),
              onChanged: null,
            ),
          ),
        );
      }),
    );
  }

  void deleteNoteMethod(int index) {
    final NotesController controller = Get.find();

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Ionicons.ios_alert_circle,
            size: 50,
            color: Colors.red,
          ),
          title: const Text(
            'Delete Alert',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to delete this Note?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyCustomElevatedButton(
                    onPresssed: () {
                      controller.deleteNote(controller.notesList[index].id);
                      // Remove the item from the list after deletion
                      controller.notesList.removeAt(index);
                      Navigator.pop(context, true);
                    },
                    label: 'Delete',
                    btnColor: Colors.red,
                  ),
                  MyCustomElevatedButton(
                    onPresssed: () => Navigator.pop(context),
                    label: 'Cancel',
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
