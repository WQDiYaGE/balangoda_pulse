import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/community_spotlights/widgets/user_community_spotlight_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_community_spotlights_controller.dart';
import '../../../../../common/widgets/appbar/custom_appbar.dart';

class UserCommunitySpotlightsScreen extends StatelessWidget {
  const UserCommunitySpotlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserCommunitySpotlightsController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Community Spotlights'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.spotlights.isEmpty) {
          return const Center(
            child: Text('No community spotlights available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.spotlights.length,
          itemBuilder: (context, index) {
            final spotlights = controller.spotlights[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserCommunitySpotlightStatus(spotlight: spotlights)
            );
          },
        );
      }),
    );
  }
}
