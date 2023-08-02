import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  LocalStorage._internal();
  static final LocalStorage _LocalStorage =  LocalStorage._internal();
  
  static LocalStorage get instance => _LocalStorage;

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'tasks.db'),
        version: _version,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, note TEXT , date TEXT , startTime TEXT , endTime TEXT, remind INTEGER , repeat TEXT , color INTEGER , isCompleted INTEGER)',
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool?> readStatusThemeMode({required String key}) async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    final bool? status = pref.getBool(key);
    return status;
  }

  Future<void> writeStatusThemeMode(
      {required String key, required bool status}) async {
    final Future<SharedPreferences> pref0 = SharedPreferences.getInstance();
    final SharedPreferences pref = await pref0;
    pref.setBool(key, status);
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

  Future<int> updateState(int id) async {
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET isCompleted = ? WHERE id = ?', [1, id]);
  }

  Future<int> editTask(int id, String title, String note) async {
    return await _db!.rawUpdate(
        'UPDATE $_tableName  SET title = ?,  note = ? WHERE id = ?',
        [title, note, id]);
  }
}
