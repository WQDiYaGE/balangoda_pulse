import 'package:get/get.dart';

import '../../../repository/development_project_repository.dart';
import '../models/development_project_model.dart';

class DevelopmentProjectController extends GetxController {
  static DevelopmentProjectController get instance => Get.find();

  final developmentProjectRepo = Get.put(DevelopmentProjectRepository());

  Future<void> saveDevelopmentProject(DevelopmentProjectModel developmentProject) async {
    try {
      await developmentProjectRepo.saveDevelopmentProject(developmentProject);
      Get.snackbar("Success", "Development project saved successfully!");
    } catch (e) {
      print("Error saving development project: ${e.toString()}");
      Get.snackbar("Error", "Failed to save development project. Please try again!");
    }
  }

  Future<void> updateDevelopmentProject(DevelopmentProjectModel developmentProject) async {
    try {
      await developmentProjectRepo.updateDevelopmentProject(developmentProject);
      Get.snackbar("Success", "Development project updated successfully!");
    } catch (e) {
      print("Error updating development project: ${e.toString()}");
      Get.snackbar("Error", "Failed to update development project. Please try again!");
    }
  }

  Future<void> deleteDevelopmentProject(String id) async {
    try {
      await developmentProjectRepo.deleteDevelopmentProject(id);
      Get.snackbar("Success", "Development Project deleted successfully!");
    } catch (e) {
      print("Error deleting development project: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete development project. Please try again!");
    }
  }
}
