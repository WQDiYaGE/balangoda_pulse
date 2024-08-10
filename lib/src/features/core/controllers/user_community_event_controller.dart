import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../admin/models/community_event_model.dart';

class UserCommunityEventController extends GetxController {
  final events = <CommunityEventModel>[].obs;
  final _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final snapshot = await _db.collection('CommunityEvents').get();
      if (snapshot.docs.isNotEmpty) {
        final eventData = snapshot.docs.map((e) => CommunityEventModel.fromSnapshot(e)).toList();
        events.value = eventData;
      } else {
        events.value = [];
      }
    } catch (e) {
      print("Error fetching events: $e");
      // Handle error
    }
  }
}
