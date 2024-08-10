import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/development_projects/widgets/user_development_project_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../controllers/user_development_project_controller.dart';

class UserDevelopmentProjectsScreen extends StatelessWidget {
  const UserDevelopmentProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDevelopmentProjectsController());

    return Scaffold(
      appBar: const CustomAppBar(title: Text('Development Projects'), showBackArrow: true),
      body: Obx(() {
        if (controller.projects.isEmpty) {
          return const Center(
            child: Text('No development projects available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.projects.length,
          itemBuilder: (context, index) {
            final projects = controller.projects[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserDevelopmentProjectStatus(project: projects)
            );
          },
        );
      }),
    );
  }
}
