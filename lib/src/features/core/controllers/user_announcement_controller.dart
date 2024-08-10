import 'package:balangoda_pulse/src/features/admin/models/announcement_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserAnnouncementController extends GetxController {
  static UserAnnouncementController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var announcements = <AnnouncementModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAnnouncements();
  }

  Future<void> fetchAnnouncements() async {
    try {
      final snapshot = await _db.collection("Announcements").get();
      if (snapshot.docs.isNotEmpty) {
        final announcementData = snapshot.docs.map((e) => AnnouncementModel.fromSnapshot(e)).toList();
        announcements.value = announcementData;
      } else {
        announcements.value = [];
      }
    } catch (e) {
      print("Error fetching announcements: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch announcements. Please try again.");
    }
  }
}
