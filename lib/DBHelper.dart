import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._privateConstructor();

  static final dbname = "hotel3.db";
  static final email = 'email';
  static final initalDate = 'initalDate';
  static final finalDate = 'finalDate';
  static final rooms = 'rooms';
  static final adults = 'adults';
  static final childern = 'childern';
  static final table = "Booking";
  static final difference = 'difference';

  static final DBHelper instance = DBHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("Table created ");
    await db.execute('''         
        CREATE TABLE $table(
        $email TEXT PRIMARY KEY,
        $initalDate TEXT,
        $finalDate TEXT,
        $rooms TEXT,
        $adults TEXT, 
        $childern TEXT,
        $difference TEXT
         );
          
        ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;

    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    Database db = await instance.database;

    return await db.rawQuery("SELECT * FROM Booking where email=?",
        [_preferences.getString("current")]);
  }
}
