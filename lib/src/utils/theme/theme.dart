import 'package:balangoda_pulse/src/utils/theme/widget_themes/appbar_theme.dart';
import 'package:balangoda_pulse/src/utils/theme/widget_themes/chip_theme.dart';
import 'package:balangoda_pulse/src/utils/theme/widget_themes/custom_elevated_button_theme.dart';
import 'package:balangoda_pulse/src/utils/theme/widget_themes/custom_outlined_button_theme.dart';
import 'package:balangoda_pulse/src/utils/theme/widget_themes/text_form_field_theme.dart';
import 'package:balangoda_pulse/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      // textTheme: CustomTextTheme.lightTextTheme,
      chipTheme: CustomChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      // checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
      // bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      // textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      // checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
      // bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme);
}