import 'package:flutter/material.dart';

import '../../../../../../common/widgets/ucb/balangoda_pulse_logo.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import 'outer_container_text_widget.dart';

class OuterContainerTextChapter extends StatelessWidget {
  const OuterContainerTextChapter({
    super.key,
    this.top = CustomSizes.outerContainerTextPositionedTop,
    this.left = CustomSizes.outerContainerTextPositionedLeft,
    required this.heading,
    required this.subHeading,
  });

  final double top, left;
  final String heading, subHeading;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: SizedBox(
            height: CustomSizes.outerContainerTextHeight,
            width: CustomSizes.outerContainerTextWidth,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OuterContainerTextWidget(
                      text: heading,
                      fontSize: CustomSizes.outerContainerHeadingSize,
                      color: CustomColors.textPrimary
                  ),
                  const SizedBox(height: CustomSizes.spaceBetweenHeadingNSubHeading),
                  OuterContainerTextWidget(
                      text: subHeading,
                      fontSize: CustomSizes.outerContainerSubHeadingSize,
                      color: CustomColors.textSecondary
                  ),
                  const SizedBox(height: CustomSizes.defaultSpace),
                  const BalangodaPULSELogo()
                ]
            )
        )
    );
  }
}