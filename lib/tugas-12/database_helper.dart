import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'user.dart';

class DatabaseHelper {
  // Singleton
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  // Getter database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final pathDatabase = join(databasePath, 'pendaftaran.db');

    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            password TEXT NOT NULL,
            asal_kota TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // CREATE / INSERT
  Future<int> insertUser(User user) async {
    final db = await database;

    return await db.insert('users', user.toMap());
  }

  // READ / QUERY
  Future<List<User>> getUsers() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      orderBy: 'id DESC',
    );

    return maps.map((map) {
      return User.fromMap(map);
    }).toList();
  }
}
