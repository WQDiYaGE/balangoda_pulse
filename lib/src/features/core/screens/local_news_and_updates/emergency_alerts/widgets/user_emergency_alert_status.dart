import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/emergency_alert_model.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/emergency_alert_detail_screen.dart';

class UserEmergencyAlertStatus extends StatelessWidget {
  final EmergencyAlertModel alert;

  const UserEmergencyAlertStatus({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {

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
                    Text(
                      alert.type,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
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
