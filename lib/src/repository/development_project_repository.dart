import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/development_project_model.dart';

class DevelopmentProjectRepository extends GetxController {
  static DevelopmentProjectRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveDevelopmentProject(DevelopmentProjectModel developmentProject) async {
    await _db.collection('DevelopmentProjects').add(developmentProject.toJson())
        .then((_) {
      Get.snackbar("Success", "Development project created successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to create development project. Try again later!");
    });
  }

  Future<void> updateDevelopmentProject(DevelopmentProjectModel developmentProject) async {
    await _db.collection('DevelopmentProjects').doc(developmentProject.id).update(developmentProject.toJson())
        .then((_) {
      Get.snackbar("Success", "Development project updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update development project. Try again later!");
    });
  }

  Future<void> deleteDevelopmentProject(String id) async {
    await _db.collection('DevelopmentProjects').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Development project deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete development project. Try again later!");
    });
  }
}
