import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';

class DbHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'tasks.db'),
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, note TEXT , date TEXT , startTime TEXT , endTime TEXT, remind INTEGER , repeat TEXT , color INTEGER , isCompleted INTEGER)',
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<int> insert(TaskModel? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  Future<List<TaskModel>> query() async {
    List<TaskModel> listTasks = [];
    List<Map<String, dynamic>> tasks = await _db!.query(_tableName);

    for (var task in tasks) {
      listTasks.add(TaskModel.fromJson(task));
    }
    return listTasks;
  }

  Future<int> delete(TaskModel? task) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task!.id]);
  }

  Future<int> update(int id) async {
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET isCompleted = ? WHERE id = ?', [1, id]);
  }
}
