import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/cultural_and_lIfestyle/widgets/user_cultural_and_lifestyle_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../controllers/user_cultural_and_lifestyle_controller.dart';

class UserCulturalAndLifestyleScreen extends StatelessWidget {
  const UserCulturalAndLifestyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserCulturalAndLifestyleController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Cultural & Lifestyle'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.culturalAndLifestyles.isEmpty) {
          return const Center(
            child: Text('No cultural and lifestyle posts available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.culturalAndLifestyles.length,
          itemBuilder: (context, index) {
            final culturalAndLifestyles = controller.culturalAndLifestyles[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserCulturalAndLifestyleStatus(culturalAndLifestyle: culturalAndLifestyles)
            );
          },
        );
      }),
    );
  }
}
