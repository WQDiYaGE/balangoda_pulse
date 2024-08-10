import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.paddingSpecial),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Here you can provide the details of your privacy policy. This might include how you collect, use, and protect user data. Be sure to cover all relevant aspects and comply with legal requirements.',
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
