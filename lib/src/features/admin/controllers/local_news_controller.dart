import 'package:get/get.dart';

import '../../../repository/local_news_repository.dart';
import '../models/local_news_model.dart';

class LocalNewsController extends GetxController {
  static LocalNewsController get instance => Get.find();

  final localNewsRepo = Get.put(LocalNewsRepository());

  Future<void> saveLocalNews(LocalNewsModel localNews) async {
    try {
      await localNewsRepo.saveLocalNews(localNews);
      Get.snackbar("Success", "Local news saved successfully!");
    } catch (e) {
      print("Error saving local news: ${e.toString()}");
      Get.snackbar("Error", "Failed to save local news. Please try again!");
    }
  }

  Future<void> updateLocalNews(LocalNewsModel localNews) async {
    try {
      await localNewsRepo.updateLocalNews(localNews);
      Get.snackbar("Success", "Local news updated successfully!");
    } catch (e) {
      print("Error updating local news: ${e.toString()}");
      Get.snackbar("Error", "Failed to update local news. Please try again!");
    }
  }

  Future<void> deleteLocalNews(String id) async {
    try {
      await localNewsRepo.deleteLocalNews(id);
      Get.snackbar("Success", "Local news deleted successfully!");
    } catch (e) {
      print("Error deleting announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete local news. Please try again!");
    }
  }
}
