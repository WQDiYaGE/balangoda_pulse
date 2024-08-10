import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/emergency_alert_model.dart';

class EmergencyAlertRepository extends GetxController {
  static EmergencyAlertRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveEmergencyAlert(EmergencyAlertModel emergencyAlert) async {
    await _db.collection('EmergencyAlerts').add(emergencyAlert.toJson())
        .then((_) {
      Get.snackbar("Success", "Emergency alert saved successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to save emergency alert. Try again later!");
    });
  }

  Future<void> updateEmergencyAlert(EmergencyAlertModel emergencyAlert) async {
    await _db.collection('EmergencyAlerts').doc(emergencyAlert.id).update(emergencyAlert.toJson())
        .then((_) {
      Get.snackbar("Success", "Emergency alert updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update emergency alert. Try again later!");
    });
  }

  Future<void> deleteEmergencyAlert(String id) async {
    await _db.collection('EmergencyAlerts').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Emergency alert deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete emergency alert. Try again later!");
    });
  }
}
