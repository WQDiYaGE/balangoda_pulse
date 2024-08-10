import 'package:get/get.dart';

import '../../../repository/emergency_alert_repository.dart';
import '../models/emergency_alert_model.dart';

class EmergencyAlertController extends GetxController {
  static EmergencyAlertController get instance => Get.find();

  final emergencyAlertRepo = Get.put(EmergencyAlertRepository());

  Future<void> saveEmergencyAlert(EmergencyAlertModel emergencyAlert) async {
    try {
      await emergencyAlertRepo.saveEmergencyAlert(emergencyAlert);
      Get.snackbar("Success", "Emergency alert saved successfully!");
    } catch (e) {
      print("Error saving emergency alert: ${e.toString()}");
      Get.snackbar("Error", "Failed to save emergency alert. Please try again!");
    }
  }

  Future<void> updateEmergencyAlert(EmergencyAlertModel emergencyAlert) async {
    try {
      await emergencyAlertRepo.updateEmergencyAlert(emergencyAlert);
      Get.snackbar("Success", "Emergency alert updated successfully!");
    } catch (e) {
      print("Error updating emergency alert: ${e.toString()}");
      Get.snackbar("Error", "Failed to update emergency alert. Please try again!");
    }
  }

  Future<void> deleteEmergencyAlert(String id) async {
    try {
      await emergencyAlertRepo.deleteEmergencyAlert(id);
      Get.snackbar("Success", "Emergency Alert deleted successfully!");
    } catch (e) {
      print("Error deleting announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete emergency alert. Please try again!");
    }
  }
}
