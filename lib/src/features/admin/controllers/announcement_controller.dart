import 'package:get/get.dart';

import '../../../repository/announcement_repository.dart';
import '../models/announcement_model.dart';

class AnnouncementController extends GetxController {
  static AnnouncementController get instance => Get.find();

  final announcementRepo = Get.put(AnnouncementRepository());

  Future<void> saveAnnouncement(AnnouncementModel announcement) async {
    try {
      await announcementRepo.saveAnnouncement(announcement);
    } catch (e) {
      print("Error saving announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to save announcement. Please try again!");
    }
  }

  Future<void> updateAnnouncement(AnnouncementModel announcement) async {
    try {
      await announcementRepo.updateAnnouncement(announcement);
      Get.snackbar("Success", "Announcement updated successfully!");
    } catch (e) {
      print("Error updating announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to update announcement. Please try again!");
    }
  }

  Future<void> deleteAnnouncement(String id) async {
    try {
      await announcementRepo.deleteAnnouncement(id);
      Get.snackbar("Success", "Announcement deleted successfully!");
    } catch (e) {
      print("Error deleting announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete announcement. Please try again!");
    }
  }
}
