import 'package:provider/provider.dart';
import '../../feature/todo/data/data.dart';
import '../../feature/todo/domain/usecases/usecases.dart';
import '../../feature/todo/presentation/provider/provider.dart';

class AppGlobalProviders {

  static get globalProviders => [
        ChangeNotifierProvider(create: (context) {
          final themService = ThemeService(
              readStatusThemeMode: ReadStatusThemeMode(
                  themeRepo: ThemeRepoIml(localStorage:LocalStorage.instance)),
              writeStatusThemeMode: WriteStatusThemeMode(
                  themeRepo: ThemeRepoIml(localStorage:LocalStorage.instance)));
          themService.getThemeStatus();
          return themService;
        }),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(
              insertTask:
                  InsertTask(taskRepo: TaskRepoIml(localStorage:LocalStorage.instance)),
              getAllTasks:
                  GetAllTasks(taskRepo: TaskRepoIml(localStorage:LocalStorage.instance)),
              deleteTask:
                  DeleteTask(taskRepo: TaskRepoIml(localStorage:LocalStorage.instance)),
              updateState:
                  UpdateState(taskRepo: TaskRepoIml(localStorage:LocalStorage.instance)),
              edit: EditTask(taskRepo: TaskRepoIml(localStorage:LocalStorage.instance))),
        )
      ];
}
