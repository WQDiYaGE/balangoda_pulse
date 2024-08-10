import 'package:balangoda_pulse/src/features/admin/screens/service_management_interface/widgets/edit_service_screen.dart';
import 'package:flutter/material.dart';

class ServiceManagementScreen extends StatelessWidget {
  // Example services data
  final List<Map<String, String>> services = [
    {'id': '1', 'title': 'Solid Waste Management Centre', 'description': 'Balangoda Municipal Council is the oldest municipal council...'},
    // Add other services here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Services'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to add new service screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AddServiceScreen()
              //     ),
              // );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service['title']!),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navigate to the edit screen with the service ID
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditServiceScreen(service: service),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
