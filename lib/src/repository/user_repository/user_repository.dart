import 'package:balangoda_pulse/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJson())
        .then((_) {
      Get.snackbar(
          "Success",
          "Your account has been created!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green
      );
    })
        .catchError((error, stackTrace) {
      Get.snackbar(
          "Error",
          "Something went wrong! Try again later.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red
      );
    });

    // catch (error) {
    //   print("Error creating user in Firestore: $error");
    //   Get.snackbar(
    //       "Error",
    //       "Something went wrong! Try again later.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.redAccent.withOpacity(0.1),
    //       colorText: Colors.red
    //   );
    //   if (kDebugMode) {
    //     print("Error creating user: $error");
    //   }
    // }
  }


// Future<UserModel?> getUserDetails(String email) async {
//   final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
//   if(snapshot.docs.isNotEmpty) {
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
//     return userData;
//   }
//   else {
//     // Handle case, where user data is not found
//     return null;
//   }
// }
//
// Future<List<UserModel>?> allUsers() async {
//   final snapshot = await _db.collection("Users").get();
//   if(snapshot.docs.isNotEmpty) {
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
//     return userData;
//   } else {
//     // Handle case, where user data is not found
//     return null;
//   }
//
// }
//
// Future<void> updateUserRecords(UserModel user) async {
//   if(user.uid != null) {
//     await _db.collection("Users").doc(user.uid).update(user.toJson());
//   } else {
//     final snapshot = await _db.collection("Users").where("Email", isEqualTo: user.email).get();
//     if(snapshot.docs.isNotEmpty) {
//       final docId = snapshot.docs.first.id;
//       await _db.collection("Users").doc(docId).update(user.toJson());
//     } else {
//       print("Cannot find any user!");
//     }
//   }
//
// }
}