import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../admin/models/cultural_and_lifestyle_model.dart';


class UserCulturalAndLifestyleController extends GetxController {
  static UserCulturalAndLifestyleController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var culturalAndLifestyles = <CulturalAndLifestyleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCulturalAndLifestyles();
  }

  Future<void> fetchCulturalAndLifestyles() async {
    try {
      final snapshot = await _db.collection("CulturalAndLifestyles").get();
      if(snapshot.docs.isNotEmpty) {
        final culturalAndLifestyleData = snapshot.docs.map((e) => CulturalAndLifestyleModel.fromSnapshot(e)).toList();
        culturalAndLifestyles.value = culturalAndLifestyleData;
      } else {
        culturalAndLifestyles.value = [];
      }
    } catch (e) {
      print("Error fetching cultural and lifestyle posts: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch cultural and lifestyle posts. Please try again.",);
    }
  }
}
