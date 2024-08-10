import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/local_news_model.dart';

class LocalNewsRepository extends GetxController {
  static LocalNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveLocalNews(LocalNewsModel localNews) async {
    await _db.collection('LocalNews').add(localNews.toJson())
        .then((_) {
      Get.snackbar("Success", "Local news saved successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to save local news. Try again later!");
    });
  }

  Future<void> updateLocalNews(LocalNewsModel localNews) async {
    await _db.collection('LocalNews').doc(localNews.id).update(localNews.toJson())
        .then((_) {
      Get.snackbar("Success", "Local news updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update local news. Try again later!");
    });
  }

  Future<void> deleteLocalNews(String id) async {
    await _db.collection('LocalNews').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Local news deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete local news. Try again later!");
    });
  }
}
