import 'package:provider/provider.dart';
import '../../feature/todo/data/data.dart';
import '../../feature/todo/domain/usecases/usecases.dart';
import '../../feature/todo/presentation/provider/provider.dart';

class AppGlobalProviders {

  static get globalProviders => [
        ChangeNotifierProvider(create: (context) {
          final themService = ThemeService(
              readStatusThemeMode: ReadStatusThemeMode(
                  themeRepo: ThemeRepoIml(netWorkManager:NetWorkManager.instance)),
              writeStatusThemeMode: WriteStatusThemeMode(
                  themeRepo: ThemeRepoIml(netWorkManager:NetWorkManager.instance)));
          themService.getThemeStatus();
          return themService;
        }),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(
              insertTask:
                  InsertTask(taskRepo: TaskRepoIml(netWorkManager:NetWorkManager.instance)),
              getAllTasks:
                  GetAllTasks(taskRepo: TaskRepoIml(netWorkManager:NetWorkManager.instance)),
              deleteTask:
                  DeleteTask(taskRepo: TaskRepoIml(netWorkManager:NetWorkManager.instance)),
              updateState:
                  UpdateState(taskRepo: TaskRepoIml(netWorkManager:NetWorkManager.instance)),
              edit: EditTask(taskRepo: TaskRepoIml(netWorkManager:NetWorkManager.instance))),
        )
      ];
}
