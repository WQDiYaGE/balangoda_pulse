import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/cultural_and_lifestyles/widgets/cultural_and_lifestyle_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/cultural_and_lifestyles/widgets/cultural_and_lifestyle_form_widget.dart';
import 'package:flutter/material.dart';
import '../../../models/cultural_and_lifestyle_model.dart';

class CulturalAndLifestyleFormScreen extends StatelessWidget {
  const CulturalAndLifestyleFormScreen({
    super.key,
    this.culturalLifestyle,
  });

  final CulturalAndLifestyleModel? culturalLifestyle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CulturalAndLifestyleFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Cultural & Lifestyle Event',
                  subTitle: 'Fill in the details below to create a cultural and lifestyle event entry',
                ),
                CulturalAndLifestyleFormWidget(culturalAndLifestyle: culturalLifestyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
