import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../controllers/user_announcement_controller.dart';
import 'widgets/user_announcement_status.dart';

class UserAnnouncementsScreen extends StatelessWidget {
  const UserAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserAnnouncementController());

    return Scaffold(
        appBar: const CustomAppBar(
            title: Text('Announcements'),
            showBackArrow: true
        ),
        body: Obx(() {
          if (controller.announcements.isEmpty) {
            return const Center(
              child: Text('No announcements available.'),
            );
          }

          return ListView.builder(
              itemCount: controller.announcements.length,
              itemBuilder: (context, index) {
                final announcement = controller.announcements[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    child: UserAnnouncementStatus(announcement: announcement)
                );
              }
          );
        })
    );
  }
}
