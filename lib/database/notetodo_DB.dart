import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteTodoDB {
  Database? _privateDb;

  final String noteTable = "Notes";
  final String todoTable = "ToDo";
  final String idColumn = "id";
  final String titleColumn = "title";
  final String contentColumn = "content";
  final String dateColumn = "date";
  final String stateColumn = "state";

  Future<Database?> get db async {
    if (_privateDb == null) {
      _privateDb = await initDb();
    }
    return _privateDb;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "notetodo.db");
    Database database = await openDatabase(path,
        version: 16, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $noteTable (
        $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
        $titleColumn TEXT,
        $contentColumn TEXT,
        $dateColumn TEXT,
        $stateColumn INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE $todoTable (
        $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
        $titleColumn TEXT,
        $dateColumn TEXT,
        $stateColumn BOOLEAN DEFAULT 0
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $noteTable");
    await db.execute("DROP TABLE IF EXISTS $todoTable");
    await _onCreate(db, newVersion);
  }

  Future<int> insertNote(
    String title,
    String content,
    DateTime date,
    bool isCompleted,
  ) async {
    Database? tempDb = await db;
    int response = await tempDb!.rawInsert(
      "INSERT INTO $noteTable($titleColumn, $contentColumn, $dateColumn, $stateColumn) VALUES (?, ?, ?, ?)",
      [title, content, date.toIso8601String(), isCompleted ? 1 : 0],
    );
    return response;
  }

  Future<int> updateNote(
    int id,
    String title,
    String content,
    DateTime date,
    bool isCompleted,
  ) async {
    Database? tempDb = await db;
    int response = await tempDb!.update(
      noteTable,
      {
        '$titleColumn': title,
        '$contentColumn': content,
        '$dateColumn': date.toIso8601String(),
        '$stateColumn': isCompleted ? 1 : 0,
      },
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return response;
  }

  Future<List<Map<String, dynamic>>> readNote() async {
    Database? tempDb = await db;
    List<Map<String, dynamic>> result = await tempDb!.query(noteTable);
    return result;
  }

  Future<int> deleteData(int noteId) async {
    Database? tempDb = await db;
    int response = await tempDb!.delete(
      noteTable,
      where: '$idColumn = ?',
      whereArgs: [noteId],
    );
    return response;
  }

  Future<int> insertTodo(
    String title,
    DateTime date,
    bool isCompleted,
  ) async {
    Database? tempDb = await db;
    int response = await tempDb!.rawInsert(
      "INSERT INTO $todoTable($titleColumn, $dateColumn, $stateColumn) VALUES (?, ?, ?)",
      [title, date.toIso8601String(), isCompleted ? 1 : 0],
    );
    return response;
  }

  Future<int> updateTodo(
    int id,
    String title,
    DateTime date,
    bool isCompleted,
  ) async {
    Database? tempDb = await db;
    int response = await tempDb!.update(
      todoTable,
      {
        '$titleColumn': title,
        '$dateColumn': date.toIso8601String(),
        '$stateColumn': isCompleted ? 1 : 0,
      },
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return response;
  }

  Future<List<Map<String, dynamic>>> readTodo() async {
    Database? tempDb = await db;
    List<Map<String, dynamic>> result = await tempDb!.query(todoTable);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database? tempDb = await db;
    int response = await tempDb!.delete(
      todoTable,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return response;
  }

  Future<int> updateTodoStatus(int id, bool isCompleted) async {
    Database? tempDb = await db;
    int response = await tempDb!.update(
      todoTable,
      {
        '$stateColumn': isCompleted ? 1 : 0,
      },
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return response;
  }
}
