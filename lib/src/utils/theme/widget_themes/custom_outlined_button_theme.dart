import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._(); // To avoid creating instances

  // -- Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          foregroundColor: secondaryColor,
          side: const BorderSide(color: secondaryColor),
          padding: const EdgeInsets.symmetric(vertical: buttonHeight)
      )
  );

  // -- Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          foregroundColor: whiteColor,
          side: const BorderSide(color: whiteColor),
          padding: const EdgeInsets.symmetric(vertical: buttonHeight)
      )
  );

}