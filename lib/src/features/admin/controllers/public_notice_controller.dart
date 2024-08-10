import 'package:get/get.dart';

import '../../../repository/public_notice_repository.dart';
import '../models/public_notice_model.dart';

class PublicNoticeController extends GetxController {
  static PublicNoticeController get instance => Get.find();

  final publicNoticeRepo = Get.put(PublicNoticeRepository());

  Future<void> savePublicNotice(PublicNoticeModel publicNotice) async {
    try {
      await publicNoticeRepo.savePublicNotice(publicNotice);
      Get.snackbar("Success", "Public notice saved successfully!");
    } catch (e) {
      print("Error saving public notice: ${e.toString()}");
      Get.snackbar("Error", "Failed to save public notice. Please try again!");
    }
  }

  Future<void> updatePublicNotice(PublicNoticeModel publicNotice) async {
    try {
      await publicNoticeRepo.updatePublicNotice(publicNotice);
      Get.snackbar("Success", "Public notice updated successfully!");
    } catch (e) {
      print("Error updating public notice: ${e.toString()}");
      Get.snackbar("Error", "Failed to update public notice. Please try again!");
    }
  }

  Future<void> deletePublicNotice(String id) async {
    try {
      await publicNoticeRepo.deletePublicNotice(id);
      Get.snackbar("Success", "Public notice deleted successfully!");
    } catch (e) {
      print("Error deleting announcement: ${e.toString()}");
      Get.snackbar("Error", "Failed to delete public notice. Please try again!");
    }
  }
}
