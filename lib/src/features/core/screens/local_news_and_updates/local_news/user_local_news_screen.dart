import 'package:balangoda_pulse/src/features/core/controllers/user_local_news_controller.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/local_news/widgets/user_local_news_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';

class UserLocalNewsScreen extends StatelessWidget {
  const UserLocalNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocalNewsController());

    return Scaffold(
      appBar: const CustomAppBar(
          title: Text('Local News'),
          showBackArrow: true
      ),
      body: Obx(() {
        if (controller.news.isEmpty) {
          return const Center(
            child: Text('No local news available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.news.length,
          itemBuilder: (context, index) {
            final news = controller.news[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserLocalNewsStatus(news: news)
            );
          },
        );




      }),
    );
  }
}
