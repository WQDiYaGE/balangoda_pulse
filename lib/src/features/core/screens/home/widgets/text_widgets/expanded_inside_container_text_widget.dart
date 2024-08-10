import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ExpandedInsideContainerTextWidget extends StatelessWidget {
  const ExpandedInsideContainerTextWidget({
    super.key,
    required this.heading,
    this.color = CustomColors.textWhite,
    required this.fontSize,
    this.applyFontWeight = false,
  });

  final String heading;
  final Color? color;
  final double fontSize;
  final bool applyFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
        heading,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: applyFontWeight ? FontWeight.bold : null
        )
    );
  }
}