import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../admin/models/emergency_alert_model.dart';

class UserEmergencyAlertsController extends GetxController {
  static UserEmergencyAlertsController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var emergencyAlerts = <EmergencyAlertModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmergencyAlerts();
  }

  Future<void> fetchEmergencyAlerts() async {
    try {
      var snapshot = await _db.collection("EmergencyAlerts").get();
      if (snapshot.docs.isNotEmpty) {
        final announcementData = snapshot.docs.map((e) => EmergencyAlertModel.fromSnapshot(e)).toList();
        emergencyAlerts.value = announcementData;
      } else {
        emergencyAlerts.value = [];
      }
    } catch (e) {
      print("Error fetching emergency alerts: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch emergency alerts. Please try again.");
    }
  }
}
