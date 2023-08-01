import 'package:provider/provider.dart';
import '../../feature/todo/data/data.dart';
import '../../feature/todo/domain/usecases/usecases.dart';
import '../../feature/todo/presentation/provider/provider.dart';

class AppGlobalProviders {

  static get globalProviders => [
        ChangeNotifierProvider(create: (context) {
          final themService = ThemeService(
              readStatusThemeMode: ReadStatusThemeMode(
                  themeRepo: ThemeRepoIml(dbHelper: DbHelper.instance)),
              writeStatusThemeMode: WriteStatusThemeMode(
                  themeRepo: ThemeRepoIml(dbHelper: DbHelper.instance)));
          themService.getThemeStatus();
          return themService;
        }),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(
              insertTask:
                  InsertTask(taskRepo: TaskRepoIml(dbHelper: DbHelper.instance)),
              getAllTasks:
                  GetAllTasks(taskRepo: TaskRepoIml(dbHelper: DbHelper.instance)),
              deleteTask:
                  DeleteTask(taskRepo: TaskRepoIml(dbHelper: DbHelper.instance)),
              updateState:
                  UpdateState(taskRepo: TaskRepoIml(dbHelper: DbHelper.instance)),
              edit: EditTask(taskRepo: TaskRepoIml(dbHelper: DbHelper.instance))),
        )
      ];
}
