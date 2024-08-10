import 'package:flutter/material.dart';

class DashboardFeatures {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardFeatures(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardFeatures> list = [
    DashboardFeatures("JS", "Announcements", "Stay Tuned for Upcoming Events and Updates", null),
    DashboardFeatures("F", "Forums", "Participate in Community Discussions", null),
    DashboardFeatures("H", "Upcoming Events", "Join Us for Community Gatherings", null),
    DashboardFeatures("K", "My Profile", "Manage Your Profile Information", null),
    DashboardFeatures("P", "Local Authority Contacts", "Contact Local Authorities", null)
  ];
}