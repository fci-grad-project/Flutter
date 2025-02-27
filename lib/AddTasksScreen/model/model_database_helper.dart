import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'tasks.db';
  static const int _dbVersion = 1;
  static const String tableName = 'tasks';

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL
      )
    ''');
  }

  // ✅ إضافة مهمة جديدة
  Future<int> addTask(String title) async {
    Database db = await database;
    return await db.insert(tableName, {'title': title});
  }

  // ✅ جلب كل المهام
  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await database;
    return await db.query(tableName);
  }

  // ✅ حذف مهمة معينة
  Future<int> deleteTask(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
