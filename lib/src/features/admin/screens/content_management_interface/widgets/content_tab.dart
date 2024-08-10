import 'package:balangoda_pulse/src/features/admin/models/announcement_model.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_status/announcement_status.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_status/public_notice_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/community_event_model.dart';
import '../../../models/community_spotlight_model.dart';
import '../../../models/cultural_and_lifestyle_model.dart';
import '../../../models/development_project_model.dart';
import '../../../models/emergency_alert_model.dart';
import '../../../models/local_news_model.dart';
import '../../../models/public_notice_model.dart';
import '../announcements/announcement_form_screen.dart';
import '../community_events/community_event_form_screen.dart';
import '../community_spotlights/community_spotlight_form_screen.dart';
import '../cultural_and_lifestyles/cultural_and_lifestyle_form_screen.dart';
import '../development_projects/development_project_form_screen.dart';
import '../emergency_alerts/emergency_alert_form_screen.dart';
import '../local_news/local_news_form_screen.dart';
import '../public_notices/public_notice_form_screen.dart';
import 'content_status/community_event_status.dart';
import 'content_status/community_spotlight_status.dart';
import 'content_status/cultural_and_lifestyle_status.dart';
import 'content_status/development_project_status.dart';
import 'content_status/emergency_alert_status.dart';
import 'content_status/local_news_status.dart';

class ContentTab extends StatelessWidget {
  const ContentTab({
    super.key,
    required this.contentType,
  });

  final String contentType;

  void _navigateToDesiredFormScreens(BuildContext context) {
    Widget desiredFormScreen;
    switch (contentType) {
      case 'Announcements':
        desiredFormScreen = const AnnouncementFormScreen();
        break;
      case 'CommunityEvents':
        desiredFormScreen = const CommunityEventFormScreen();
        break;
      case 'PublicNotices':
        desiredFormScreen = const PublicNoticeFormScreen();
        break;
      case 'LocalNews':
        desiredFormScreen = const LocalNewsFormScreen();
        break;
      case 'DevelopmentProjects':
        desiredFormScreen = const DevelopmentProjectFormScreen();
        break;
      case 'EmergencyAlerts':
        desiredFormScreen = const EmergencyAlertFormScreen();
        break;
      case 'CommunitySpotlights':
        desiredFormScreen = const CommunitySpotlightFormScreen();
        break;
      case 'CulturalAndLifestyles':
        desiredFormScreen = const CulturalAndLifestyleFormScreen();
        break;
      default:
        throw Exception('Unknown content type');
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => desiredFormScreen));
  }

  Stream<QuerySnapshot> _fetchContentStream() {
    return FirebaseFirestore.instance.collection(contentType).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _fetchContentStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No content available'));
          }

          List<Widget> contentWidgets = [];
          switch (contentType) {
            case 'Announcements':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                AnnouncementModel announcement = AnnouncementModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: AnnouncementStatus(announcement: announcement),
                );
              }).toList();
              break;

            case 'CommunityEvents':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                CommunityEventModel event = CommunityEventModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: CommunityEventStatus(event: event),
                );
              }).toList();
              break;

            case 'PublicNotices':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                PublicNoticeModel notice = PublicNoticeModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: PublicNoticeStatus(notice: notice),
                );
              }).toList();
              break;

            case 'LocalNews':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                LocalNewsModel news = LocalNewsModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: LocalNewsStatus(news: news),
                );
              }).toList();
              break;

            case 'DevelopmentProjects':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                DevelopmentProjectModel project = DevelopmentProjectModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: DevelopmentProjectStatus(project: project),
                );
              }).toList();
              break;

            case 'EmergencyAlerts':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                EmergencyAlertModel alert = EmergencyAlertModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: EmergencyAlertStatus(alert: alert),
                );
              }).toList();
              break;

            case 'CommunitySpotlights':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                CommunitySpotlightModel spotlight = CommunitySpotlightModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: CommunitySpotlightStatus(spotlight: spotlight),
                );
              }).toList();
              break;

            case 'CulturalAndLifestyles':
              contentWidgets = snapshot.data!.docs.map((DocumentSnapshot document) {
                CulturalAndLifestyleModel culturalAndLifestyle = CulturalAndLifestyleModel.fromSnapshot(document);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: CulturalAndLifestyleStatus(culturalAndLifestyle: culturalAndLifestyle),
                );
              }).toList();
              break;

            default:
              contentWidgets = [
                const Center(
                    child: Text('Unknown content type')
                )
              ];
          }

          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: contentWidgets,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToDesiredFormScreens(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
