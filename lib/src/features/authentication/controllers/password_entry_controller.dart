import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:balangoda_pulse/src/utils/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../screens/password_entry_screen/widgets/password_entry_form_widget.dart';

class PasswordEntryController extends GetxController {
  static PasswordEntryController get instance => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final isHidden = false.obs;

  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    if (isVerified) {
      Get.off(() => const PasswordEntryFormWidget());
    } else {
      Get.snackbar('Error', 'Invalid OTP. Please try again.');
    }
  }

  Future<void> loginUserWithPassword() async {
    try {
      var user = await AuthenticationRepository.instance.loginUserWithPhoneNumber(phoneNumber.text.trim(), password.text.trim());
      if (user != null) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.snackbar("Login Error", "Invalid phone number or password.");
      }
    } catch (e) {
      Helper.errorSnackBar(title: "Login Error", message: e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}