import 'package:balangoda_pulse/src/features/core/screens/home/widgets/text_widgets/expanded_container_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ExpandedContainer extends StatelessWidget {
  const ExpandedContainer({
    super.key,
    required this.heading,
    required this.subHeading,
    this.height = CustomSizes.expandedContainerHeight,
    this.backgroundColor = CustomColors.accentColor,
    required this.applyBottomLeft,
    required this.applyTopRight,
  });


  final String heading, subHeading;
  final double? height;
  final Color? backgroundColor;
  final bool applyBottomLeft;
  final bool applyTopRight;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: const EdgeInsets.only(
            top: CustomSizes.expandedContainerMarginTop,
            bottom: CustomSizes.expandedContainerMarginBottom
        ),
        padding: const EdgeInsets.only(
            left: CustomSizes.expandedContainerPaddingCommon,
            bottom: CustomSizes.expandedContainerPaddingCommon,
            right: CustomSizes.expandedContainerPaddingCommon
        ),
        child: Container(
            padding: const EdgeInsets.only(
                left: CustomSizes.expandedInsideContainerPaddingLeft,

                top: CustomSizes.expandedInsideContainerPaddingTopBottom,
                bottom: CustomSizes.expandedInsideContainerPaddingTopBottom
            ),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: applyTopRight ? const Radius.circular(CustomSizes.featureCardRadius) : const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                    bottomLeft: applyBottomLeft ? const Radius.circular(CustomSizes.featureCardRadius) : const Radius.circular(20)

                ),
                boxShadow: [
                  BoxShadow(
                      color: CustomColors.darkerGrey.withOpacity(0.3),
                      offset: const Offset(CustomSizes.featureCardOffsetX, CustomSizes.featureCardOffsetY),
                      blurRadius: CustomSizes.featureCardBlurRadius,
                      spreadRadius: CustomSizes.featureCardSpreadRadius
                  )
                ]
            ),
            child: ExpandedContainerTextWidget(
                heading: heading,
                subHeading: subHeading
            )
        )

    );
  }
}