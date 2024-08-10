import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/community_event_model.dart';

class CommunityEventRepository extends GetxController {
  static CommunityEventRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveCommunityEvent(CommunityEventModel communityEvent) async {
    try {
      await _db.collection('CommunityEvents').add(communityEvent.toJson());
      Get.snackbar("Success", "Community event saved successfully!");
    } catch (e) {
      print("Error saving community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to save community event. Try again later!");
    }
  }

  Future<void> updateCommunityEvent(CommunityEventModel communityEvent) async {
    try {
      await _db.collection('CommunityEvents').doc(communityEvent.id).update(communityEvent.toJson());
      Get.snackbar("Success", "Community event updated successfully!");
    } catch (e) {
      print("Error updating community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to update community event. Try again later!");
    }
  }

  Future<void> deleteCommunityEvent(String id) async {
    try {
      await _db.collection('CommunityEvents').doc(id).delete();
      Get.snackbar("Success", "Community event deleted successfully!");
    } catch (e) {
      print("Error deleting community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete community event. Try again later!");
    }
  }


  Future<List<CommunityEventModel>> getCommunityEvents() async {
    try {
      QuerySnapshot snapshot = await _db.collection('CommunityEvents').get();
      return snapshot.docs.map((doc) => CommunityEventModel.fromSnapshot(doc)).toList();
    } catch (e) {
      print("Error fetching community events: ${e.toString()}");
      throw e;
    }
  }
}
