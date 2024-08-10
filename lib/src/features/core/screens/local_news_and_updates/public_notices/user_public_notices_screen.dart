import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/public_notices/widgets/user_public_notice_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../controllers/user_public_notices_controller.dart';

class UserPublicNoticesScreen extends StatelessWidget {
  const UserPublicNoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserPublicNoticesController());

    return Scaffold(
      appBar: const CustomAppBar(
          title: Text('Public Notices'),
          showBackArrow: true
      ),
      body: Obx(() {
        if (controller.publicNotices.isEmpty) {
          return const Center(
            child: Text('No public notices available.'),
          );
        }

        return ListView.builder(
            itemCount: controller.publicNotices.length,
            itemBuilder: (context, index) {
              final notices = controller.publicNotices[index];
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                  child: UserPublicNoticeStatus(notice: notices)
              );
            });
      }),
    );
  }
}
