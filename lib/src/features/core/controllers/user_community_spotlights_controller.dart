import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../admin/models/community_spotlight_model.dart';

class UserCommunitySpotlightsController extends GetxController {
  static UserCommunitySpotlightsController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var spotlights = <CommunitySpotlightModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSpotlights();
  }

  Future<void> fetchSpotlights() async {
    try {
      final snapshot = await _db.collection("CommunitySpotlights").get();
      if (snapshot.docs.isNotEmpty) {
        final spotlightData = snapshot.docs.map((e) => CommunitySpotlightModel.fromSnapshot(e)).toList();
        spotlights.value = spotlightData;
      } else {
        spotlights.value = [];
      }
    } catch (e) {
      print("Error fetching community spotlights: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch community spotlights. Please try again.");
    }
  }
}
