import 'package:get/get.dart';
import 'package:notedo_app/database/notetodo_DB.dart';
import 'package:notedo_app/models/note_model.dart';

class NotesController extends GetxController {
  late final NoteTodoDB _database;
  RxList<NoteCardModel> notesList = <NoteCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _database = NoteTodoDB();
    _loadNotes();
  }

  void _loadNotes() async {
    final List<Map<String, dynamic>> notesData = await _database.readNote();
    notesList.assignAll(notesData.map((data) => NoteCardModel.fromMap(data)));
  }

  Future<int> addNote(
      String title, String content, DateTime date, bool isCompleted) async {
    final int response = await _database.insertNote(
      title,
      content,
      date,
      isCompleted,
    );
    if (response > 0) {
      notesList.insert(
        0,
        NoteCardModel(
          title: title,
          content: content,
          date: date,
          id: response,
          isCompleted: isCompleted,
        ),
      );
    }
    return response;
  }

  void updateNote(int index, String title, String content, DateTime date,
      bool isCompleted) async {
    final updatedNote = NoteCardModel(
      title: title,
      content: content,
      date: date,
      id: notesList[index].id,
      isCompleted: isCompleted,
    );

    await _database.updateNote(
      updatedNote.id,
      updatedNote.title,
      updatedNote.content,
      updatedNote.date,
      updatedNote.isCompleted,
    );

    // notesList.removeAt(index);
    // notesList.insert(0, updatedNote);
  }

  Future<int> deleteNote(int noteId) async {
    return await _database.deleteData(noteId);
  }
}
