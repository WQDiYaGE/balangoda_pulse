import 'package:balangoda_pulse/src/features/core/screens/schedule/routes/pages.dart';
import 'package:flutter/material.dart';

import '../../../../authentication/screens/splash_screen/splash_screen.dart';
import '../data/local/model/task_model.dart';
import '../page_not_found.dart';
import '../presentation/pages/new_task_screen.dart';
import '../presentation/pages/tasks_screen.dart';
import '../presentation/pages/update_task_screen.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
