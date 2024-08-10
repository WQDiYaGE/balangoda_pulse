import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/community_events/widgets/community_event_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/community_events/widgets/community_event_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/community_event_model.dart';

class CommunityEventFormScreen extends StatelessWidget {
  const CommunityEventFormScreen({
    super.key,
    this.communityEvent,
  });

  final CommunityEventModel? communityEvent;

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
                const CommunityEventFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Community Event',
                  subTitle: 'Fill in the details below to create a community event',
                ),
                CommunityEventFormWidget(communityEvent: communityEvent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
