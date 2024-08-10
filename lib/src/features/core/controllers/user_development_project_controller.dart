import 'package:balangoda_pulse/src/features/admin/models/development_project_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserDevelopmentProjectsController extends GetxController {
  static UserDevelopmentProjectsController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var projects = <DevelopmentProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    try {
      final snapshot = await _db.collection("DevelopmentProjects").get();
      if (snapshot.docs.isNotEmpty) {
        final projectData =
        snapshot.docs.map((e) => DevelopmentProjectModel.fromSnapshot(e)).toList();
        projects.value = projectData;
      } else {
        projects.value = [];
      }
    } catch (e) {
      print("Error fetching projects: ${e.toString()}");
      Get.snackbar("Fetching Error", "Failed to fetch projects. Please try again.");
    }
  }
}
