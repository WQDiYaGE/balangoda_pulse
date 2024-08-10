import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:balangoda_pulse/src/features/admin/models/public_notice_model.dart';

class UserPublicNoticesController extends GetxController {
  static UserPublicNoticesController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var publicNotices = <PublicNoticeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPublicNotices();
  }

  Future<void> fetchPublicNotices() async {
    try {
      var snapshot = await _db.collection("PublicNotices").get();
      if (snapshot.docs.isNotEmpty) {
        final publicNoticesData = snapshot.docs.map((e) => PublicNoticeModel.fromSnapshot(e)).toList();
        publicNotices.value = publicNoticesData;
      } else {
        publicNotices.value = [];
      }
    } catch (e) {
      print("Error fetching public notices: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch public notices. Please try again.");
    }
  }
}
