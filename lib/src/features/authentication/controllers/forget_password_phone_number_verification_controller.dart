
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNumberVerificationController extends GetxController {
  static ForgetPasswordPhoneNumberVerificationController get instance => Get.find();

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();


  // void phoneAuthentication(String phoneNumber, UserModel user) {
  //   AuthenticationRepository.instance.phoneAuthentication(phoneNumber, user);
  // }
}