import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:notedo_app/controllers/getx/todo_controller.dart';
import 'package:notedo_app/widgets/custom_button.dart';
import 'package:notedo_app/widgets/dialog_addtodo.dart';
import 'package:notedo_app/widgets/item_siidable.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({
    super.key,
    this.hasAppBar = false,
    this.title = '',
  });

  final String title;
  final bool hasAppBar;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _mycontroller = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hasAppBar
          ? AppBar(
              surfaceTintColor: Colors.transparent,
              title: Text(widget.title),
            )
          : null,
      body: Obx(
        () => ListView.separated(
            key: const PageStorageKey('todos'),
            padding: const EdgeInsets.only(
                top: 32, bottom: 120, left: 20, right: 20),
            itemCount: todoController.todosList.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 6,
                ),
            itemBuilder: (context, index) {
              final todo = todoController.todosList[index];
              return GestureDetector(
                onTap: () {
                  editTaskMethod(index);
                  todoController.isChecked.value = todo.isCompleted;
                },
                child: NoteAndTodoItemCardSlidable(
                    noteTitle: todo.title,
                    hasContent: false,
                    date: todo.date,
                    deleteNoteMethod: (context) => deleteNoteMethod(index),
                    noteContent: '',
                    leading: true,
                    isCecked: todo.isCompleted,
                    onChanged: (value) {
                      todoController.checkBoxSelected(value, index);
                    }),
              );
            }),
      ),
    );
  }

  // void checkBoxSelected(bool? value, int index) {
  //   setState(() {
  //     todoTasksList[index][2] = !todoTasksList[index][2];
  //   });
  // }

  void editTaskMethod(int index) {
    final TodoController controller = Get.find();
    _mycontroller.text = controller.todosList[index].title;

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AddTodoTaskDialog(
          mycontroller: _mycontroller,
          onSave: () async {
            // int originalIndex =
            //     controller.todosList.indexOf(controller.todosList[index]);
            // controller.todosList.removeAt(originalIndex);
            if (_mycontroller.text.isNotEmpty) {
              controller.deleteTodo(controller.todosList[index].id);
              controller.addTodo(
                _mycontroller.text,
                DateTime.now(),
                controller.isChecked.value,
              );
            }

            _mycontroller.clear();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void deleteNoteMethod(int index) {
    final TodoController controller = Get.find();
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Ionicons.ios_alert_circle,
                size: 50, color: Colors.red),
            title: const Text(
              'Delete Alert',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Are you sure you want to delete this Task?',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyCustomElevatedButton(
                      onPresssed: () {
                        controller.deleteTodo(controller.todosList[index].id);
                        Navigator.pop(context, true);
                      },
                      label: 'Delete',
                      btnColor: Colors.red,
                    ),
                    MyCustomElevatedButton(
                      onPresssed: () => Navigator.pop(context),
                      label: 'Cancle',
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
