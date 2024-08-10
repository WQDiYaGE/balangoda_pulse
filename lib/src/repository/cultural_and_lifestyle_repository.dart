import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/cultural_and_lifestyle_model.dart';

class CulturalAndLifestyleRepository extends GetxController {
  static CulturalAndLifestyleRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveCulturalAndLifestyle(CulturalAndLifestyleModel culturalLifestyle) async {
    await _db.collection('CulturalAndLifestyles').add(culturalLifestyle.toJson())
        .then((_) {
      Get.snackbar("Success", "Cultural & lifestyle event created successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to create cultural & lifestyle event. Try again later!");
    });
  }

  Future<void> updateCulturalAndLifestyle(CulturalAndLifestyleModel culturalAndLifestyle) async {
    await _db.collection('CulturalAndLifestyles').doc(culturalAndLifestyle.id).update(culturalAndLifestyle.toJson())
        .then((_) {
      Get.snackbar("Success", "Cultural & lifestyle event updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update cultural & lifestyle event. Try again later!");
    });
  }

  Future<void> deleteCulturalAndLifestyle(String id) async {
    await _db.collection('CulturalAndLifestyles').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Cultural and lifestyle deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete Cultural and lifestyle. Try again later!");
    });
  }
}
