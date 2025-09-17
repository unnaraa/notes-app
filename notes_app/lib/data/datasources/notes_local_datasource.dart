import 'package:notes_app/data/models/response/notes_response.dart';
import 'package:sqflite/sqflite.dart';

class NotesLocalDatasource {
  NotesLocalDatasource._init();
  static final NotesLocalDatasource instance = NotesLocalDatasource._init();

  final String tableNotes = 'notes';

  static Database? _database;

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableNotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        deskripsi TEXT,
        image TEXT,
        userId INTEGER
        createAt INTEGER
        updateAt INTEGER
      )
    ''');
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/notes.db';

    return openDatabase(databasePath, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<void> insertAllNotes(List<Notes> notes) async {
    final db = await instance.database;

    await db.delete(
      tableNotes,
    );

    for(var note in notes) {
      await db.insert(
        tableNotes,
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // ambil data notes
  Future<List<Notes>> getAllNotes() async {
    final db = await instance.database;
    
    final result = await db.query(tableNotes, orderBy: 'createdAt DESC');
    return result.map((note) => Notes.fromMap(note)).toList();
  }

  // ambil data notes by id
  Future<Notes?> getNotesBtId(int id) async {
    final db = await instance.database;

    final result = await db.query(
      tableNotes,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if(result.isEmpty) return null;
    return Notes.fromMap(result.first);
  }

  // hapus data notes by id
  Future<void> deleteNotesById(int id) async {
    final db = await instance.database;

    await db.delete(
      tableNotes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}