import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/announcement_model.dart';

class AnnouncementRepository extends GetxController {
  static AnnouncementRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveAnnouncement(AnnouncementModel announcement) async {
    await _db.collection('Announcements').add(announcement.toJson())
        .then((_) {
      Get.snackbar("Success", "Announcement saved successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to save announcement. Try again later!");
    });
  }

  Future<void> updateAnnouncement(AnnouncementModel announcement) async {
    await _db.collection('Announcements').doc(announcement.id).update(announcement.toJson())
        .then((_) {
      Get.snackbar("Success", "Announcement updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update announcement. Try again later!");
    });
  }

  Future<void> deleteAnnouncement(String id) async {
    await _db.collection('Announcements').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Announcement deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete announcement. Try again later!");
    });
  }
}
