import 'package:flutter/material.dart';

class DashboardTopFeatures {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;
  
  DashboardTopFeatures(this.title, this.heading, this.subHeading, this.onPress);
  
  static List<DashboardTopFeatures> list = [
    DashboardTopFeatures("Announcements", "Stay Tuned for Upcoming Events & Updates", "Get the latest announcements and updates", null),
    DashboardTopFeatures("Forums", "Participate in Community Discussions", "Engage in discussions with other community members", null),
    DashboardTopFeatures("Upcoming Events", "Join Us for Community Gatherings", "Find out about upcoming events", null)
    // DashboardTopFeatures("My Profile", "Manage your Profile Information", "Update your personal details and preferences", null),
    // DashboardTopFeatures("Local Authority Contacts", "Contact Local Authorities", "Get in touch with your local authorities", null)

  ];
}