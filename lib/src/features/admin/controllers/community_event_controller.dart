import 'package:get/get.dart';

import '../../../repository/community_event_repository.dart';
import '../models/community_event_model.dart';

class CommunityEventController extends GetxController {
  static CommunityEventController get instance => Get.find();

  final communityEventRepo = Get.put(CommunityEventRepository());
  var communityEvents = <CommunityEventModel>[].obs;

  Future<void> saveCommunityEvent(CommunityEventModel communityEvent) async {
    try {
      await communityEventRepo.saveCommunityEvent(communityEvent);
      Get.snackbar("Success", "Community event saved successfully!");
    } catch (e) {
      print("Error saving community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to save community event. Please try again!");
    }
  }

  Future<void> updateCommunityEvent(CommunityEventModel communityEvent) async {
    try {
      await communityEventRepo.updateCommunityEvent(communityEvent);
      Get.snackbar("Success", "Community event updated successfully!");
    } catch (e) {
      print("Error updating community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to update community event. Please try again!");
    }
  }

  Future<void> deleteCommunityEvent(String id) async {
    try {
      await communityEventRepo.deleteCommunityEvent(id);
      Get.snackbar("Success", "Community event deleted successfully!");
    } catch (e) {
      print("Error deleting community event: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete community event. Please try again!");
    }
  }


  Future<void> fetchCommunityEvents() async {
    try {
      var events = await communityEventRepo.getCommunityEvents();
      communityEvents.assignAll(events);
    } catch (e) {
      print("Error fetching community events: ${e.toString()}");
      Get.snackbar("Error", "Failed to fetch community events. Please try again!");
    }
  }
}
