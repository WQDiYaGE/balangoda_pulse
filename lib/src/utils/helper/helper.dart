import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static void errorSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
