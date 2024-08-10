import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/widgets/features.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/widgets/top_features.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(dashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dashboardTitle, style: Theme.of(context).textTheme.bodyMedium),
              Text(dashboardHeading, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: dashboardPadding),

              // Search Box
              const SearchBox(),
              const SizedBox(height: dashboardPadding),

              // Features
              const Features(),
              const SizedBox(height: dashboardPadding),

              // Banners
              const Banners(),
              const SizedBox(height: dashboardPadding),

              // Top Features
              Text(
                  dashboardTopFeatures, 
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                      fontSizeFactor: 1.2
                  )
              ),
              const TopFeatures()
              

            ]
          )
        )
      )
    );
  }
}










