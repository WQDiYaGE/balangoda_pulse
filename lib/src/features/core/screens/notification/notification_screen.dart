import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:balangoda_pulse/src/features/core/screens/notification/notifications.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final notifications = Notifications.notification;
    return Scaffold(
      appBar: CustomAppBar(
          title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: CustomColors.black
              )
      )),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.notifications), // You can choose an icon that fits the notification type
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: Text(
                // Format the dateTime as you wish, here's a simple example
                '${notification.dateTime.hour}:${notification.dateTime.minute}',
              ),
              onTap: () {
                // Handle the notification tap
                // You can navigate to the specific part of the app that the notification is about
              },
            ),
          );
        },
      ),
    );
  }
}
