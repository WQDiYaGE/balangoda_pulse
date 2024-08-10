import 'dart:async';

import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:balangoda_pulse/src/utils/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/screens/home/home_screen.dart';

class EmailVerificationController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();

    setTimerForAutoRedirect();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer to prevent leaks
    super.onClose();
  }


  /// -- Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch(e) {
      Helper.errorSnackBar(title: ohSnap, message: e.toString());
    }

  }

  void resendVerificationEmail() {
    sendVerificationEmail();
  }

  /// -- Set Timer to check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      FirebaseAuth.instance.currentUser?.reload().then((_) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null && user.emailVerified) {
          timer.cancel();  // Stop the timer when the email is verified
          Get.offAll(() => const HomeScreen()); // Redirect to HomeScreen
        }
      }).catchError((error) {
        // Handle possible errors here
        print("Error reloading user: $error");
      });
    });
  }


  /// -- Manually Check if Verification Completed then Redirect
  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload().then((_) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        // Redirect to HomeScreen or wherever necessary
        Get.offAll(() => const HomeScreen());
      }
    }).catchError((error) {
      // Handle any errors
      print("Error checking verification status: $error");
    });
  }

}