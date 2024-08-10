import 'package:balangoda_pulse/src/features/admin/screens/emergency_alerts/widgets/alert_dialog_form.dart';
import 'package:balangoda_pulse/src/features/admin/screens/emergency_alerts/widgets/alerts.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EmergencyAlerts extends StatefulWidget {
  const EmergencyAlerts({super.key});

  @override
  State<EmergencyAlerts> createState() => _EmergencyAlertsState();
}

class _EmergencyAlertsState extends State<EmergencyAlerts> {
  List<Alerts> alerts = [
    Alerts('Power Outage', 'A power outage is scheduled for maintenance on July 18.'),
    Alerts('Flood Warning', 'Flood warning in the downtown area. Stay indoors and avoid driving.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.primaryColor.withOpacity(0.8),
                  CustomColors.primaryColor.withOpacity(0.6),
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                onPressed: () {
                  _showAddAlertDialog(context);
                },
                child: const Text('Create New Alert'),
              ),
              const SizedBox(height: CustomSizes.spaceBetweenSubSections),
              Expanded(
                child: ListView.builder(
                  itemCount: alerts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(alerts[index].title),
                        subtitle: Text(alerts[index].description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showEditAlertDialog(context, alerts[index]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  alerts.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogForm(
          onSave: (alert) {
            setState(() {
              alerts.add(alert);
            });
          },
        );
      },
    );
  }

  void _showEditAlertDialog(BuildContext context, Alerts alert) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogForm(
          alert: alert,
          onSave: (editedAlert) {
            setState(() {
              int index = alerts.indexOf(alert);
              alerts[index] = editedAlert;
            });
          },
        );
      },
    );
  }
}
