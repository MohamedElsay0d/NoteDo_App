import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:notedo_app/controllers/getx/change_theme_controller.dart';
import 'package:notedo_app/controllers/getx/note_controller.dart';
import 'package:notedo_app/controllers/getx/todo_controller.dart';
import 'package:notedo_app/views/edit_note_screen.dart';
import 'package:notedo_app/views/notes_screen.dart';
import 'package:notedo_app/views/todo_screen.dart';
import 'package:notedo_app/widgets/custom_button.dart';
import 'package:notedo_app/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tabsList = [
    'Notes',
    'Todos',
  ];
  final TextEditingController _titleController = TextEditingController();
  final ChangeAppThemeController getxController =
      Get.put<ChangeAppThemeController>(ChangeAppThemeController());
  final NotesController noteTodoController =
      Get.put<NotesController>(NotesController());

  final TodoController todoController =
      Get.put<TodoController>(TodoController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int currentIndex = 0;
  String title = 'Notes';
  String floatingButtonText = 'Add Note';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
          ),
          toolbarHeight: 80,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.sort,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(66),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade100,
                ),
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      title = tabsList[value];
                      currentIndex = value;
                      floatingButtonText =
                          'Add ${(tabsList[value]).substring(0, (tabsList[value]).length - 1)}';
                    });
                  },
                  dividerHeight: 0,
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: List.generate(
                    tabsList.length,
                    (index) {
                      return Tab(
                        child: Text(
                          tabsList[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Ionicons.ios_moon),
                onPressed: () {
                  getxController.changeTheme();
                },
                tooltip: 'change theme',
              ),
            )
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              NotesScreen(),
              TodoScreen(),
            ]),
        floatingActionButton: GetBuilder<NotesController>(
          builder: (_) {
            return getFloatingActionButton();
          },
        ),
      ),
    );
  }

  getFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        if (tabsList[currentIndex] == 'Notes') {
          var noteContent = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return EditNoteScreen();
          }));
          if (noteContent != null && noteContent[0] != '' ||
              noteContent[1] != '') {
            await noteTodoController.addNote(
              noteContent[0],
              noteContent[1],
              DateTime.now(),
              true,
            );
            // controller.deleteNote(controller.notesList[index].id);
          }
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(Ionicons.ios_add_circle,
                      size: 50, color: Colors.green),
                  title: const Text(
                    'Add Todo Task',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Enter Task',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            return null;
                          },
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
                              onPresssed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (_titleController.text.isNotEmpty) {
                                    todoController.addTodo(
                                      _titleController.text,
                                      DateTime.now(),
                                      false,
                                    );
                                  }
                                  Navigator.of(context).pop();
                                  _titleController.clear();
                                }
                              },
                              label: 'Add',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      },
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      icon: const Icon(Ionicons.ios_create_outline),
      tooltip: 'create new task',
      label: Text(floatingButtonText),
    );
  }
}
