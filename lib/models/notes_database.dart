import 'package:sqflite/sqflite.dart';
import 'note.dart';

//connection database with async

class NotesDatabase {
  static final _name = "NotesDatabase.db";
  static final _version = 1;

  static Database? _database;

  static final tableName = 'notes';

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    return await openDatabase(_name, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName (
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               title TEXT,
               content TEXT,
               noteColor TEXT
              )''');
  }

  Future<int> insertNote(Note note) async {
    return await _database!.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateNote(Note note) async {
    return await _database!.update(tableName, note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    return await _database!.query(tableName);
  }

  Future<Map<String, dynamic>> getNotes(int id) async {
    var result =
        await _database!.query(tableName, where: 'id = ?', whereArgs: [id]);

    if (result.length > 0) {
      return result.first;
    }

    return result.first;
  }

  Future<int?> deleteNote(int id) async {
    return await _database?.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  closeDatabase() async {
    await _database?.close();
  }
}
