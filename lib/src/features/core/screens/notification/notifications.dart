import 'package:balangoda_pulse/src/features/core/screens/notification/notification.dart';

class Notifications {
  static List<Notification> notification = [
    Notification(
      title: 'Community Event',
      message: 'Join us for the community clean-up this Saturday at 9 AM.',
      dateTime: DateTime.now().subtract(const Duration(minutes: 5)),
    )
  ];
}