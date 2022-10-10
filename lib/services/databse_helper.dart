import 'package:flutter/cupertino.dart';

import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:test_pt_kb_insurance/models/attendance.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'employee_attendace.db');
    var db = await openDatabase(path, version: 6, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int NewViersion) async {
    await db.execute(
        'CREATE TABLE attendances(id INTEGER PRIMARY KEY AUTOINCREMENT, nik TEXT, name TEXT,date TEXT,clock_out Text,clock_in TEXT)');
  }

  Future<List> getAtt() async {
    var dbClient = await db;
    var result = await dbClient.query(
      'attendances',
      columns: ['id', 'nik', 'name', "date", 'clock_in', "clock_out"],
    );
    return result.toList();
  }

  Future<int> saveAtt(
      {required BuildContext context, required AttendanceModel att}) async {
    var dbClient = await db;
    var result = await dbClient.insert("attendances", att.toJson());
    return result;
  }

  Future<int> deleteAtt(String id) async {
    var dbClient = await db;
    return await dbClient
        .delete('attendances', where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateAtt(AttendanceModel att) async {
    var dbClient = await db;
    return await dbClient.update("attendances", att.toJsonUpdate(),
        where: "id = ?", whereArgs: [att.id]);
  }
}
