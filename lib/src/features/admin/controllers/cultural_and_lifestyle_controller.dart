import 'package:get/get.dart';
import '../../../repository/cultural_and_lifestyle_repository.dart';
import '../models/cultural_and_lifestyle_model.dart';

class CulturalAndLifestyleController extends GetxController {
  static CulturalAndLifestyleController get instance => Get.find();

  final culturalAndLifestyleRepo = Get.put(CulturalAndLifestyleRepository());

  Future<void> saveCulturalAndLifestyle(CulturalAndLifestyleModel culturalLifestyle) async {
    try {
      await culturalAndLifestyleRepo.saveCulturalAndLifestyle(culturalLifestyle);
      Get.snackbar("Success", "Cultural & lifestyle event saved successfully!");
    } catch (e) {
      print("Error saving cultural & lifestyle event: ${e.toString()}");
      Get.snackbar("Error", "Failed to save cultural & lifestyle event. Please try again!");
    }
  }

  Future<void> updateCulturalAndLifestyle(CulturalAndLifestyleModel culturalAndLifestyle) async {
    try {
      await culturalAndLifestyleRepo.updateCulturalAndLifestyle(culturalAndLifestyle);
      Get.snackbar("Success", "Cultural & lifestyle event updated successfully!");
    } catch (e) {
      print("Error updating cultural & lifestyle event: ${e.toString()}");
      Get.snackbar("Error", "Failed to update cultural & lifestyle event. Please try again!");
    }
  }

  Future<void> deleteCulturalAndLifestyle(String id) async {
    try {
      await culturalAndLifestyleRepo.deleteCulturalAndLifestyle(id);
      Get.snackbar("Success", "Cultural & lifestyle event deleted successfully!");
    } catch (e) {
      print("Error deleting cultural & lifestyle event: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete cultural & lifestyle event. Please try again!");
    }
  }
}
