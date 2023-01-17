import 'package:sqflite/sqflite.dart';
import 'note.dart';

class NotesDatabase {
  static final _name = "NotesDatabase.db";
  static final _version = 1;

  Database database;
  static final tableName = 'notes';

  initDatabase() async {
    database = await openDatabase(
      _name,
      version: _version,
      onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE $tableName (
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               title TEXT,
               content TEXT,
               noteColor TEXT
              )''');
      },
    );
  }

  Future<int> insertNote(Note note) async {
    return await database.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
