import 'package:get/get.dart';

import '../../../repository/community_spotlight_repository.dart';
import '../models/community_spotlight_model.dart';

class CommunitySpotlightController extends GetxController {
  static CommunitySpotlightController get instance => Get.find();

  final communitySpotlightRepo = Get.put(CommunitySpotlightRepository());

  Future<void> saveCommunitySpotlight(CommunitySpotlightModel communitySpotlight) async {
    try {
      await communitySpotlightRepo.saveCommunitySpotlight(communitySpotlight);
      Get.snackbar("Success", "Community spotlight saved successfully!");
    } catch (e) {
      print("Error saving community spotlight: ${e.toString()}");
      Get.snackbar("Error", "Failed to save community spotlight. Please try again!");
    }
  }

  Future<void> updateCommunitySpotlight(CommunitySpotlightModel communitySpotlight) async {
    try {
      await communitySpotlightRepo.updateCommunitySpotlight(communitySpotlight);
      Get.snackbar("Success", "Community spotlight updated successfully!");
    } catch (e) {
      print("Error updating community spotlight: ${e.toString()}");
      Get.snackbar("Error", "Failed to update community spotlight. Please try again!");
    }
  }

  Future<void> deleteCommunitySpotlight(String id) async {
    try {
      await communitySpotlightRepo.deleteCommunitySpotlight(id);
      Get.snackbar("Success", "Community spotlight deleted successfully!");
    } catch (e) {
      print("Error deleting community spotlight: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete community spotlight. Please try again!");
    }
  }
}
