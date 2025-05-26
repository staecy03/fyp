/*import 'package:mansau_sabah/models/plan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 2;  // Updated version for schema changes
  static final String _tableName = "plans";

  // Return the database instance
  static Future<Database> initDb() async {
    if (_db != null) {
      return _db!; // Return the existing database if already initialized
    }
    try {
      String _path = join(await getDatabasesPath(), 'plans.db');
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new database");
          return db.execute("CREATE TABLE $_tableName("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING, district STRING, location STRING, "
              "activity STRING, date STRING, startTime STRING, "
              "endTime STRING, remind INTEGER, colour INTEGER, "
              "isCompleted INTEGER, userId TEXT)" // Add userId column
              );
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute("ALTER TABLE $_tableName ADD COLUMN userId TEXT");
            print("Database upgraded: userId column added.");
          }
        },
      );
      return _db!; // Return the database instance
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Insert data into the database
  static Future<int> insert(Plan? plan) async {
    if (plan == null) {
      return -1;  // Return error code if plan is null
    }
    print("Insert function called");
    return await _db?.insert(_tableName, plan.toJson()) ?? 1;
  }

  // Query data based on userId
  static Future<List<Map<String, dynamic>>> query(String userId) async {
    final db = await initDb(); // Get the database instance
    return await db.query(
      _tableName,
      where: 'userId = ?', // Filter by userId
      whereArgs: [userId],
    );
  }

  // Delete a plan from the database
  static Future<int> delete(Plan plan) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [plan.id]);
  }

  // Update the plan status
  static Future<int> updatePlan(Plan plan) async {
    print("UpdatePlan function called");
    return await _db!.update(
      _tableName,
      plan.toJson(),
      where: 'id = ?',
      whereArgs: [plan.id],
    );
  }

  // Mark task as completed
  static Future<int> update(int id) async {
    return await _db!.rawUpdate(''' 
      UPDATE $_tableName 
      SET isCompleted = ? 
      WHERE id = ? 
    ''', [1, id]);
  }

  // Close the database when not needed
  static Future<void> closeDb() async {
    final db = await initDb();
    await db.close();
  }
}



import 'package:mansau_sabah/models/plan.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "plans";

  // Return the database instance
  static Future<Database> initDb() async {
    if (_db != null) {
      return _db!; // Return the existing database if already initialized
    }
    try {
      String _path = await getDatabasesPath() + 'plans.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new one");
          return db.execute("CREATE TABLE $_tableName("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING, district STRING, location STRING, "
              "activity STRING, date STRING, startTime STRING, "
              "endTime STRING, remind INTEGER, colour INTEGER, "
              "isCompleted INTEGER, userId TEXT)" // Add userId column
              );
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute("ALTER TABLE $_tableName ADD COLUMN userId TEXT");
            print("Database upgraded: userId column added.");
          }
        },
      );
      return _db!; // Return the database instance
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Insert data into the database
  static Future<int> insert(Plan? plan) async {
    print("Insert function called");
    return await _db?.insert(_tableName, plan!.toJson()) ?? 1;
  }

  // Query data based on userId
  static Future<List<Map<String, dynamic>>> query(String userId) async {
    final db = await initDb(); // Get the database instance
    return await db.query(
      _tableName,
      where: 'userId = ?', // Filter by userId
      whereArgs: [userId],
    );
  }

  // Delete a plan from the database
  static Future<int> delete(Plan plan) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [plan.id]);
  }

  // Update the plan status
  static Future<int> updatePlan(Plan plan) async {
    print("UpdatePlan function called");
    return await _db!.update(
      _tableName,
      plan.toJson(),
      where: 'id = ?',
      whereArgs: [plan.id],
    );
  }

  // Mark task as completed
  static Future<int> update(int id) async {
    return await _db!.rawUpdate('''
      UPDATE $_tableName 
      SET isCompleted = ? 
      WHERE id = ? 
    ''', [1, id]);
  }
}

import 'package:mansau_sabah/models/plan.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "plans";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'plans.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, district STRING, location STRING, "
            "activity STRING, date STRING, startTime STRING, "
            "endTime STRING, "
            "remind INTEGER,"
            " colour INTEGER,  "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Plan? plan) async {
    print("insert function called");
    return await _db?.insert(_tableName, plan!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query(String userId) async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Plan plan) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [plan.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
      UPDATE plans
      SET isCompleted=?
      WHERE id =?
      ''', [1, id]);
  }

  static Future<int> updatePlan(Plan plan) async {
    print("updatePlan function called");
    return await _db!.update(
      _tableName,
      plan.toJson(),
      where: 'id = ?',
      whereArgs: [plan.id],
    );
  }
}*/
