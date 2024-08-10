import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyles{
  static final verticalFeatureShadowStyle = BoxShadow(
    color: CustomColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalFeatureShadowStyle = BoxShadow(
      color: CustomColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}