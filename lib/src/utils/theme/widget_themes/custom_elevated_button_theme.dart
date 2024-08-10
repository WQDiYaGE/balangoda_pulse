import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._(); // To avoid creating instances

  // -- Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        foregroundColor: whiteColor,
        backgroundColor: secondaryColor,
        side: const BorderSide(color: secondaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)
    ),
  );

  // -- Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        foregroundColor: secondaryColor,
        backgroundColor: whiteColor,
        side: const BorderSide(color: secondaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)
    ),
  );

}