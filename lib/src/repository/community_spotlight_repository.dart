import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/community_spotlight_model.dart';

class CommunitySpotlightRepository extends GetxController {
  static CommunitySpotlightRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveCommunitySpotlight(CommunitySpotlightModel communitySpotlight) async {
    await _db.collection('CommunitySpotlights').add(communitySpotlight.toJson())
        .then((_) {
      Get.snackbar("Success", "Community spotlight created successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to create community spotlight. Try again later!");
    });
  }

  Future<void> updateCommunitySpotlight(CommunitySpotlightModel communitySpotlight) async {
    await _db.collection('CommunitySpotlights').doc(communitySpotlight.id).update(communitySpotlight.toJson())
        .then((_) {
      Get.snackbar("Success", "Community spotlight updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update community spotlight. Try again later!");
    });
  }

  Future<void> deleteCommunitySpotlight(String id) async {
    await _db.collection('CommunitySpotlights').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Community spotlight deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete community spotlight. Try again later!");
    });
  }
}
