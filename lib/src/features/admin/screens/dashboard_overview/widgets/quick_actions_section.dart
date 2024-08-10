import 'package:balangoda_pulse/src/features/admin/screens/dashboard_overview/widgets/quick_action_button.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(CustomSizes.medium),
          children: [
            QuickActionButton(
                title: 'Create New Article',
                icon: Icons.article,
                onPressed: () {

                }),
            QuickActionButton(
                title: 'Create New Event',
                icon: Icons.event,
                onPressed: () {

                }
            ),
            QuickActionButton(
                title: 'Create New Alert',
                icon: Icons.add_alert,
                onPressed: () {

                }
            )
          ]
        )
      ]
    );
  }
}