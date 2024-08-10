import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/emergency_alerts/widgets/emergency_alert_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/emergency_alerts/widgets/emergency_alert_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/emergency_alert_model.dart';

class EmergencyAlertFormScreen extends StatelessWidget {
  const EmergencyAlertFormScreen({
    super.key,
    this.emergencyAlert,
  });

  final EmergencyAlertModel? emergencyAlert;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EmergencyAlertFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Emergency Alert',
                  subTitle: 'Fill in the details below to create an emergency alert',
                ),
                EmergencyAlertFormWidget(emergencyAlert: emergencyAlert),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
