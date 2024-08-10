import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';

class DataSharingPreferencesScreen extends StatelessWidget {
  const DataSharingPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Data Sharing Preferences'),
      ),
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.paddingSpecial),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here you can describe how users can manage their data sharing preferences. Include options for opting in or out of data sharing, and explain what data will be shared and with whom.',
                style: TextStyle(fontSize: 16),
              ),
              // Add more text or sections as needed
            ],
          ),
        ),
      ),
    );
  }
}
