import 'package:balangoda_pulse/src/common/widgets/texts/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CustomColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.textSize = TextSizes.small
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
              title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              textSize: textSize
          )
        )
      ]
    );
  }
}
