import 'package:balangoda_pulse/src/features/core/screens/calendar/sf_calandar_screen.dart';
import 'package:get/get.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/local_news_and_updates_screen.dart';
import 'package:balangoda_pulse/src/features/personalization/screens/settings/settings_screens.dart';

import '../../screens/local_services_directory/local_services_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const LocalNewsAndUpdatesScreen(),
    const LocalServicesScreen(),
    const SfCalandarScreen(),
    // const CalendarScreen(),
    const SettingsScreens(),
  ];
}
