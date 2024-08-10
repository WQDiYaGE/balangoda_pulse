import 'package:balangoda_pulse/src/features/admin/controllers/community_event_controller.dart';
import 'package:balangoda_pulse/src/features/admin/screens/admin_drawer.dart';
import 'package:balangoda_pulse/src/features/admin/screens/emergency_alerts/emergency_alerts.dart';
import 'package:balangoda_pulse/src/features/admin/screens/local_news_and_updates/local_news_and_updates.dart';
import 'package:balangoda_pulse/src/features/admin/screens/schedule/schedule.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/admin_login_screen_updated/admin_login_screen_updated.dart';
import 'package:balangoda_pulse/src/features/authentication/user_management/user_controller.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/data/local/data_sources/tasks_data_provider.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/data/repository/task_repository.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/presentation/bloc/tasks_bloc.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/presentation/pages/new_task_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/routes/pages.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:balangoda_pulse/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transition;
import 'package:nb_utils/nb_utils.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthenticationRepository(), permanent: true);
    Get.put(UserController(), permanent: true);

    Get.put(CommunityEventController(), permanent: true); // Ensure these are permanent
  })
      .catchError((error) {
    if (kDebugMode) {
      print("Failed to initialize Firebase: $error");
    }
  });

  // Initialize SharedPreferences and TaskDataProvider
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  TaskDataProvider taskDataProvider = TaskDataProvider(sharedPreferences);
  TaskRepository taskRepository = TaskRepository(taskDataProvider: taskDataProvider);

  runApp(MyApp(taskRepository: taskRepository, isDev: true));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.taskRepository,
    required this.isDev
  });

  final TaskRepository taskRepository;
  final bool isDev;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TasksBloc(taskRepository)
        )
      ],
      child: GetMaterialApp(
          themeMode: ThemeMode.system,
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          defaultTransition: get_transition.Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
          initialRoute: Pages.initial,
          getPages: [
            GetPage(name: '/adminLoginScreenUpdated', page: () => const AdminLoginScreenUpdated()),

            GetPage(name: '/admin_dashboard', page: () => const AdminDrawer()),

            GetPage(name: '/local_news_updates', page: () => const LocalNewsAndUpdates()),
            GetPage(name: '/schedule', page: () => const Schedule()),
            GetPage(name: '/emergency_alerts', page: () => const EmergencyAlerts()),
            // GetPage(name: '/issue_reporting', page: () => const IssueReporting()),

            // -- Schedule
            GetPage(name: Pages.createNewTask, page: () => const NewTaskScreen()),
          ],
          home: const SplashScreen()
        // isDev ? const SfCalandarScreen() : const SplashScreen()
        // isDev ? const Schedule() : const SplashScreen()
      )
    );
  }
}

// Define the shared state class
class FabVisibilityState with ChangeNotifier {
  bool _showMainFab = true;

  bool get showMainFab => _showMainFab;

  void showMainFabOnly() {
    _showMainFab = true;
    notifyListeners();
  }

  void showTaskFabOnly() {
    _showMainFab = false;
    notifyListeners();
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(".appable/"),
            leading: const Icon(Icons.ondemand_video)),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {}),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(children: [
              Text("Heading", style: Theme.of(context).textTheme.displayMedium),
              Text("Sub-heading",
                  style: Theme.of(context).textTheme.titleSmall),
              Text("Paragraph", style: Theme.of(context).textTheme.bodyLarge),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Elevated Button"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Outlined Button"),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Image(
                    image: AssetImage("assets/images/BalangodaPULSE.png")),
              )
            ])));
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Image.asset('assets/BalangodaPULSE.png', height: 150)
          ]))),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        Colors.deepOrangeAccent // Text color of the button
                    ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )))
    ]));
  }
}
