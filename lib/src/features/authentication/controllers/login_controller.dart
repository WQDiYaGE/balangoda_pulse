import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_otp_screen/otp_screen.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:balangoda_pulse/src/utils/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../user_management/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final isHidden = false.obs;
  final isGoogleLoading = false.obs;

  final isPhoneNumberVerified = false.obs;

  final _auth = FirebaseAuth.instance;
  final userController = Get.put(UserController());

  void checkPhoneNumber(String phoneNumber) async {
    bool isAuthenticated = await authenticateAnonymously(); // Ensure user is authenticated
    if(isAuthenticated) {
      bool isVerified = await AuthenticationRepository.instance.checkPhoneNumberExists(phoneNumber);
      if(isVerified) {
        isPhoneNumberVerified.value = true;
        print("Phone number is verified!");
      } else {
        print("Phone Number is not verified!");
        Helper.errorSnackBar(title: "Verification Error", message: "Phone number not recognized.");
      }
    } else {
      Get.snackbar('Error', 'Authentication failed');
    }
  }

  Future<bool> authenticateAnonymously() async {
    try {
      await _auth.signInAnonymously();
      return true;
    } catch(e) {
      print("Error during anonymous authentication: $e");
      return false;
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
      Get.to(() => const OTPScreen());
    } catch(error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      // Log the error or display a message
      var message = "Login Failed";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }
      Helper.errorSnackBar(title: "Login Error", message: message);
      if (kDebugMode) {
        print(e.message);
      }
      rethrow;  // Optionally rethrow the error if you need to handle it higher up
    } catch (e) {
      // Handle any other errors that might occur
      Helper.errorSnackBar(title: "Login Error", message: "An unexpected error occurred.");
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void googleSignIn() {
    try {
      isGoogleLoading.value = true;
      AuthenticationRepository.instance.signInWithGoogle();

      isGoogleLoading.value = false;
    } catch(e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: ohSnap, message: e.toString());
    }
  }
}