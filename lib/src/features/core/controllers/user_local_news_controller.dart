import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../admin/models/local_news_model.dart';

class UserLocalNewsController extends GetxController {
  static UserLocalNewsController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var news = <LocalNewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocalNews();
  }

  Future<void> fetchLocalNews() async {
    try {
      final snapshot = await _db.collection("LocalNews").orderBy('dateTime', descending: true).get();
      if (snapshot.docs.isNotEmpty) {
        final newsData = snapshot.docs.map((e) => LocalNewsModel.fromSnapshot(e)).toList();
        news.value = newsData;
      } else {
        news.value = [];
      }
    } catch (e) {
      print("Error fetching local news: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch local news. Please try again.");
    }
  }
}
