// sebagai pendukung aplikasi, kelas helper digunakan untuk CRUD. Helper akan menggunakan kelas model.
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_todoey_list/models/task.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject(); // create Object Class

  // factory : when implementing a constructor that doesn’t always create a new instance of its class.
  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper!;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'listToDo.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE listTodo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task TEXT,
        checklist BOOL
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database!;
  }

  //read data databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await database;
    var mapList = await db.query('listToDo', orderBy: 'id');
    return mapList;
  }

  //create data in databases
  Future<int> insert(Task object) async {
    Database db = await database;
    int count = await db.insert('listToDo', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Task object) async {
    Database db = await database;
    int count = await db.update('listToDo', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await database;
    int count = await db.delete('listToDo', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Task>> getTaskList() async {
    var TaskMapList = await select();
    int count = TaskMapList.length;
    List<Task> TaskList = [];
    for (int i = 0; i < count; i++) {
      TaskList.add(Task.fromMap(TaskMapList[i]));
    }
    return TaskList;
  }
}
