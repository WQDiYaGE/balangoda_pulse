import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get instance => Get.find();

  final username = TextEditingController();
  final password = TextEditingController();
  var isHidden = true.obs;

  Future<void> login() async {
    String username = this.username.text;
    String password = this.password.text;

    if(username == 'admin' && password == 'admin') {
      Get.offNamed('admin_dashboard');
    } else {
      Get.snackbar(
          'Login Error', 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }

}