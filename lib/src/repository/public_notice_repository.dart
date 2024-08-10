import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../features/admin/models/public_notice_model.dart';

class PublicNoticeRepository extends GetxController {
  static PublicNoticeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> savePublicNotice(PublicNoticeModel publicNotice) async {
    await _db.collection('PublicNotices').add(publicNotice.toJson())
        .then((_) {
      Get.snackbar("Success", "Public notice saved successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to save public notice. Try again later!");
    });
  }

  Future<void> updatePublicNotice(PublicNoticeModel publicNotice) async {
    await _db.collection('PublicNotices').doc(publicNotice.id).update(publicNotice.toJson())
        .then((_) {
      Get.snackbar("Success", "Public notice updated successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to update public notice. Try again later!");
    });
  }

  Future<void> deletePublicNotice(String id) async {
    await _db.collection('PublicNotices').doc(id).delete()
        .then((_) {
      Get.snackbar("Success", "Public notice deleted successfully!");
    })
        .catchError((error) {
      Get.snackbar("Error", "Failed to delete public notice. Try again later!");
    });
  }
}
