import 'package:flutter/foundation.dart'; // import ChangeNotifier
import 'package:flutter_todoey_list/models/task.dart';
import 'dart:collection';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todoey_list/db_helper.dart';

class TaskData extends ChangeNotifier {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Task> _taskList = [];

  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Breads'),
  ];

  // list yang isinya tidak bisa dimodifikasi - seperti di hidden.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount => _tasks.length;

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.ToogleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTaskListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = dbHelper.getTaskList();
      taskListFuture.then((_taskList) {
        _taskList = _taskList;
        count = _taskList.length;
        notifyListeners();
      });
    });
  }
}
