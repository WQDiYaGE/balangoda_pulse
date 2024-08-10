import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/community_spotlights/widgets/community_spotlight_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/community_spotlights/widgets/community_spotlight_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/community_spotlight_model.dart';

class CommunitySpotlightFormScreen extends StatelessWidget {
  const CommunitySpotlightFormScreen({
    super.key,
    this.spotlight,
  });

  final CommunitySpotlightModel? spotlight;

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
                const CommunitySpotlightFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Community Spotlight',
                  subTitle: 'Fill in the details below to create a community spotlight entry',
                ),
                CommunitySpotlightFormWidget(spotlight: spotlight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
