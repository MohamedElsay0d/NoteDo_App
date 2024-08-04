import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notedo_app/database/notetodo_DB.dart';
import 'package:notedo_app/models/todo_model.dart';

class TodoController extends GetxController {
  late final NoteTodoDB _database;
  var todosList = <TodoCardModel>[].obs;
  final TextEditingController mycontroller =
      TextEditingController(); // Define mycontroller
  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    _database = NoteTodoDB();
    fetchTodos();
  }

  // Fetch all todos from the database
  void fetchTodos() async {
    final List<Map<String, dynamic>> todoesData = await _database.readTodo();
    todosList.assignAll(todoesData.map((data) => TodoCardModel.fromMap(data)));
  }

  // Add a new todo to the database and update the local list
  Future<int> addTodo(String title, DateTime date, bool isCompleted) async {
    final int response = await _database.insertTodo(
      title,
      date,
      isCompleted,
    );
    if (response > 0) {
      todosList.insert(
        0,
        TodoCardModel(
          title: title,
          date: date,
          id: response,
          isCompleted: isCompleted,
        ),
      );
    }
    return response;
  }

  // Update an existing todo in the database and update the local list

  void updateTodo(
      int index, String title, DateTime date, bool isCompleted) async {
    final updatedToDo = TodoCardModel(
      title: title,
      date: date,
      id: todosList[index].id,
      isCompleted: isCompleted,
    );

    await _database.updateTodo(
      updatedToDo.id,
      updatedToDo.title,
      updatedToDo.date,
      updatedToDo.isCompleted,
    );
  }

  // Delete a todo from the database and update the local list
  Future<int> deleteTodo(int todoId) async {
    await _database.deleteTodo(todoId);

    todosList.removeWhere((todo) => todo.id == todoId);

    update();

    return todoId;
  }

  // Define checkBoxSelected method
  void checkBoxSelected(bool? value, int id) async {
    todosList[id].isCompleted = value!;
    await _database.updateTodoStatus(
        todosList[id].id, todosList[id].isCompleted);

    todosList.refresh();
  }

  goCompleted(bool isCompleted) {
    if (isCompleted == 1) {
      isChecked.value = true;
    } else {
      isChecked.value = false;
    }
    return isChecked.value;
  }
}
