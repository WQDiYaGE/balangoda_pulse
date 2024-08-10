import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(bottom: CustomSizes.medium)
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ListTile(
                leading: const Icon(
                    Icons.notifications,
                    color: Colors.blueAccent
                ),
                title: Text('Recent activity ${index + 1}'),
                subtitle: Text('Details about recent activity ${index + 1}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
                onTap: () {

                }
              ),
            );
          },
        ),
      ],
    );
  }
}