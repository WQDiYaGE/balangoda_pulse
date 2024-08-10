import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  late final RxString _verificationId;
  late final RxInt? _resendToken;

  void setVerificationData(String verificationId, int? resendToken) {
    _verificationId.value = verificationId;
    _resendToken?.value = resendToken!;
  }


  Future<void> verifyOTP(String otp) async {
    // try {
    //   var credential = PhoneAuthProvider.credential(
    //       verificationId: _verificationId.value,
    //       smsCode: otp
    //   );
    //
    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    //   return userCredential.user != null;
    // } catch(e) {
    //   print('Failed to verify OTP: ${e.toString()}');
    //   return false;
    // }

    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const NavigationMenu()) : Get.back();
    // try {
    //   bool isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    //   return isVerified;
    // } catch (e) {
    //   print('Error during OTP verification: ${e.toString()}'); // Log the error
    //   return false; // Return false on error
    // }
  }

  Future<void> resendOTP(String phoneNumber) async {
    if (_resendToken?.value != null) {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            // Optionally handle automatic sign-in
          },
          verificationFailed: (FirebaseAuthException e) {
            print("Verification failed: ${e.message}");
            Get.snackbar('Error', 'Failed to resend OTP: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) {
            _verificationId.value = verificationId;
            _resendToken?.value = resendToken!;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            _verificationId.value = verificationId;
          },
          forceResendingToken: _resendToken?.value // Use the stored resend token
      );
    }
  }


}