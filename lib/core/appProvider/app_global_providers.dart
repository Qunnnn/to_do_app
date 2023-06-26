import 'package:provider/provider.dart';
import '../../feature/todo/data/data.dart';
import '../../feature/todo/domain/usecases/usecases.dart';
import '../../feature/todo/presentation/provider/provider.dart';

class AppGlobalProviders {
  static get globalProviders => [
        ChangeNotifierProvider(
          create: (context) => ThemeService(
              readStatusThemeMode: ReadStatusThemeMode(
                  themeRepo: ThemeRepoIml(dbHelper: DbHelper())),
              writeStatusThemeMode: WriteStatusThemeMode(
                  themeRepo: ThemeRepoIml(dbHelper: DbHelper()))),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(
              insertTask:
                  InsertTask(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              getAllTasks:
                  GetAllTasks(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              deleteTask:
                  DeleteTask(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              updateState:
                  UpdateState(taskRepo: TaskRepoIml(dbHelper: DbHelper())),
              edit: EditTask(taskRepo: TaskRepoIml(dbHelper: DbHelper()))),
        )
      ];
}
