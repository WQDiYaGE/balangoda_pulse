import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/announcements/widgets/announcement_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/announcements/widgets/announcement_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/announcement_model.dart';

class AnnouncementFormScreen extends StatelessWidget {
  const AnnouncementFormScreen({
    super.key,
    this.announcement
  });

  final AnnouncementModel? announcement;

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
                const AnnouncementFormHeaderWidget(
                    image: 'assets/images/community-cohesion.png',
                    title: 'Create Announcement',
                    subTitle: 'Fill in the details below to create an announcement'
                ),
                AnnouncementFormWidget(announcement: announcement)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
