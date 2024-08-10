import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/emergency_alerts/widgets/user_emergency_alert_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../controllers/user_emergency_alerts_controller.dart';

class UserEmergencyAlertsScreen extends StatelessWidget {
  const UserEmergencyAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserEmergencyAlertsController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Emergency Alerts'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.emergencyAlerts.isEmpty) {
          return const Center(
            child: Text('No emergency alerts available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.emergencyAlerts.length,
          itemBuilder: (context, index) {
            final emergencyAlerts = controller.emergencyAlerts[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: UserEmergencyAlertStatus(alert: emergencyAlerts)
            );
          },
        );
      }),
    );
  }
}
