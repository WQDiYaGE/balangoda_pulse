// import 'package:balangoda_pulse/src/features/authentication/models/user_model.dart';
// import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
// import 'package:balangoda_pulse/src/repository/user_repository/user_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find();
//
//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());
//
//   getUserData() async {
//     final email = _authRepo.firebaseUser.value?.email;
//     if(email != null) {
//       return await _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar("Error", "Login to continue!");
//     }
//   }
//
//   Future<List<UserModel>?> getAllUsers() async {
//     await _userRepo.allUsers();
//   }
//
//   updateRecord(UserModel user) async {
//     await _userRepo.updateUserRecords(user);
//   }
//
//
// }