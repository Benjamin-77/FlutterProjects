import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;


class SQLHelper {

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        telephone TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sqlTp.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createUser(String name, String? telephone) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'telephone': telephone};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateUser(
      int id, String name, String? telephone) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'telephone': telephone,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Quelque chose s'est aml passé lors de la suppression : $err");
    }
  }
}