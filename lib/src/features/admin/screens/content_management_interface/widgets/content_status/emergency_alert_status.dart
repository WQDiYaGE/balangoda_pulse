import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/emergency_alert_controller.dart';
import '../../../../models/emergency_alert_model.dart';
import '../../emergency_alerts/emergency_alert_form_screen.dart';
import 'details_screens/emergency_alert_detail_screen.dart';

class EmergencyAlertStatus extends StatelessWidget {
  final EmergencyAlertModel alert;

  const EmergencyAlertStatus({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final EmergencyAlertController controller = Get.put(EmergencyAlertController());

    return GestureDetector(
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
              padding: const EdgeInsets.all(CustomSizes.medium),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              alert.type,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87
                              ),
                            ),
                          ),
                          Row(
                              children: [
                                IconButton(
                                    color: Colors.blue,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EmergencyAlertFormScreen(emergencyAlert: alert)
                                          )
                                      );
                                    },
                                    icon: const Icon(Icons.edit_outlined)
                                ),
                                IconButton(
                                    color: Colors.red,
                                    onPressed: () async {
                                      await controller.deleteEmergencyAlert(alert.id!);
                                    },
                                    icon: const Icon(Icons.delete_outlined)
                                )
                              ]
                          )
                        ]
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      alert.dateTime.toLocal().toString().split(' ')[0],
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      '${alert.urgencyLevel}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: alert.urgencyLevel == 'High' ? Colors.red : (alert.urgencyLevel == 'Medium' ? Colors.orange : Colors.green),
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                        alert.detailedInformation,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        )
                    )
                  ]
              )
          )
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmergencyAlertDetailScreen(alert: alert)
            )
        );
      },
    );
  }
}
