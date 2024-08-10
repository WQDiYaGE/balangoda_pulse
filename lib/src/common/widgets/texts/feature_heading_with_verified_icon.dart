import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'enums.dart';
import 'feature_heading.dart';

class FeatureHeadingWithVerifiedIcon extends StatelessWidget {
  const FeatureHeadingWithVerifiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.iconColor = CustomColors.primaryColor,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.featureTextSizes = TextSizes.small
  });

  final String title;
  final Color? textColor, iconColor;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes featureTextSizes;


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FeatureHeading(
                title: title,
                color: textColor,
                maxLines: maxLines,
                textAlign: textAlign,
                featureTextSize: featureTextSizes
            ),
          ),
          const SizedBox(width: CustomSizes.xs),
          Icon(Iconsax.verify5, color: iconColor, size: CustomSizes.iconXs)
        ]
    );
  }
}