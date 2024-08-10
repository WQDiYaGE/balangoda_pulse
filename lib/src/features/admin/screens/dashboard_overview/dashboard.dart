import 'package:balangoda_pulse/src/features/admin/screens/dashboard_overview/widgets/metrics_section.dart';
import 'package:balangoda_pulse/src/features/admin/screens/dashboard_overview/widgets/notifications_section.dart';
import 'package:balangoda_pulse/src/features/admin/screens/dashboard_overview/widgets/quick_actions_section.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu)
        ),
        title: const Text('Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.primaryColor.withOpacity(0.8),
                CustomColors.primaryColor.withOpacity(0.6)
              ]
          )
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(CustomSizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const MetricsSection(),
              const SizedBox(height: CustomSizes.spaceBetweenSubSections),
              const NotificationsSection(),
              const SizedBox(height: CustomSizes.spaceBetweenSubSections),
              const QuickActionsSection(),

              _buildNavigationCard(
                  context,
                  title: 'Local News & Updates',
                  icon: Icons.newspaper,
                  route: '/local_news_updates'
              ),
              const SizedBox(height: CustomSizes.spaceBetweenNavigationButtons),

              _buildNavigationCard(
                  context,
                  title: 'Schedule',
                  icon: Icons.schedule,
                  route: '/schedule'
              ),
              const SizedBox(height: CustomSizes.spaceBetweenNavigationButtons),

              _buildNavigationCard(
                  context,
                  title: 'Emergency Alerts',
                  icon: Icons.warning,
                  route: '/emergency_alerts'
              ),
              const SizedBox(height: CustomSizes.spaceBetweenNavigationButtons),

              _buildNavigationCard(
                  context,
                  title: 'Issue Reporting',
                  icon: Icons.report,
                  route: '/issue_reporting'
              )
            ]
          )
        ),
      )
    );
  }
}

Widget _buildNavigationCard(
    BuildContext context, {
      required String title,
      required IconData icon,
      required String route,
    }) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.medium),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 30, color: CustomColors.primaryColor),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}










