import 'package:provider/provider.dart';
import '../../feature/todo/data/data.dart';
import '../../feature/todo/domain/usecases/usecases.dart';
import '../../feature/todo/presentation/provider/provider.dart';

class AppGlobalProviders {
  static get globalProviders => [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(
              insertTask:
                  InsertTask(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              getAllTasks:
                  GetAllTasks(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              deleteTask:
                  DeleteTask(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              updateTask:
                  UpdateTask(taskRepo: TaskRepoIml(dbHelper: DbHelper()))),
        )
      ];
}
