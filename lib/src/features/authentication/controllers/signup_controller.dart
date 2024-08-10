import 'dart:math';

import 'package:balangoda_pulse/src/features/authentication/models/user_model.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_otp_screen/otp_screen.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/dashboard/dashboard.dart';
import 'package:balangoda_pulse/src/features/core/screens/home/home_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:balangoda_pulse/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());
  final _auth = FirebaseAuth.instance;


  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final isHidden = true.obs; // For password visibility

  // var isProcessing = false.obs; // To track, if the process is ongoing

  Future<void> createUser(UserModel user) async {
    try {

      await userRepo.createUser(user);

      // registerUser(user.email, user.password);

      // For the phone number authentication
      phoneAuthentication(user.phoneNumber);
      Get.to(() => const OTPScreen());

      // if(user.phoneNumber.isNotEmpty && user.password!.isNotEmpty) {
      //   // Wait for phone verification to complete
      //   await authRepo.phoneAuthentication(user.phoneNumber, () async {
      //     await storeUserInFirestore(user);
      //     Get.offAll(() => const NavigationMenu());
      //   });
      // } else {
      //   Get.snackbar("Invalid Data!", "Please enter valid data.");
      // }
    } catch(e) {
      print("Error creating user: ${e.toString()}");
      Get.snackbar("Sign-Up Error", "Failed to create user. Please try again.");
    } finally {
      // isProcessing.value = false;
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    } catch(error) {
      rethrow;
    }
    // String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String;
    // if(error != null) {
    //   Get.showSnackbar(GetSnackBar(message: error.toString()));
    // }
  }

  void phoneAuthentication(String phoneNumber) {
    try {
      AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
    } catch(error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
    // if(user.uid != null) {
    //   try {
    //     await authRepo.phoneAuthentication(phoneNumber, user, () {
    //       storeUserInFirestore(user);
    //     });
    //
    // }
  }

// Future<void> storeUserInFirestore(UserModel user) async {
//   try {
//     await userRepo.createUser(user);
//   } catch(error) {
//     if (kDebugMode) {
//       print("The issue might be on the storeUserInFirestore in SignUpController!");
//     }
//     Get.snackbar("Error", "Failed to store user details. Please try again!");
//     rethrow;
//   }
// }


// void onEmailVerificationCompleted() {
//   Get.offAll(() => const Dashboard());
// }
//
// @override
// void onInit() {
//   super.onInit();
//   AuthenticationRepository.instance.onEmailVerificationCompleted = onEmailVerificationCompleted;
// }
}