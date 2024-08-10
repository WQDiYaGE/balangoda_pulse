import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/community_events/widgets/user_community_events_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_community_event_controller.dart';

class UserCommunityEventsScreen extends StatelessWidget {
  const UserCommunityEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserCommunityEventController());

    return Scaffold(
      appBar: const CustomAppBar(
          title: Text('Community Events'),
          showBackArrow: true
      ),
      body: Obx(() {
        if (controller.events.isEmpty) {
          return const Center(
            child: Text('No events available.'),
          );
        }
        return ListView.builder(
          itemCount: controller.events.length,
          itemBuilder: (context, index) {
            final events = controller.events[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserCommunityEventStatus(event: events)
            );
          }
        );
      }),
    );
  }
}
