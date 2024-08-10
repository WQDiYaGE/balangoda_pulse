// import 'package:balangoda_pulse/src/features/core/screens/calendar/sf_calandar_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/local_news_and_updates_screen.dart';
// import 'package:balangoda_pulse/src/features/personalization/screens/settings/settings_screens.dart';
// import '../screens/discussion_forums/core/domain/services/auth_service.dart';
// import '../screens/discussion_forums/features/chat/presentation/screens/realtime_conversations_screen/realtime_conversations_screen.dart';
// import '../screens/local_services_directory/local_services_screen.dart';

// class NavigationController extends GetxController {
  // final Rx<int> selectedIndex = 0.obs;

  // List<Widget> getScreens(BuildContext context) {
  //   final authService = Get.find<AuthService>();

  //   return [
  //     const LocalNewsAndUpdatesScreen(),
  //     const LocalServicesScreen(),
  //     authService.authenticatedUser != null
  //         ? RealtimeConversationsScreen(user: authService.authenticatedUser!)
  //         : const Center(child: Text('Unauthorized')),
  //     const SfCalandarScreen(),
  //     const SettingsScreens()
  //   ];
  // }

  // void onTabTapped(int index, BuildContext context) {
  //   selectedIndex.value = index;
  // }
// }
