import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        prefixIconColor: secondaryColor,
        floatingLabelStyle: const TextStyle(color: secondaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(width: 2, color: secondaryColor)
        )
      );

  static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
        ),
        prefixIconColor: primaryColor,
        floatingLabelStyle: const TextStyle(color: primaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(width: 2, color: primaryColor)
        )
      );
}