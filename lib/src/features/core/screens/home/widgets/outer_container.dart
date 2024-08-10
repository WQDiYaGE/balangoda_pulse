import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class OuterContainer extends StatelessWidget {
  const OuterContainer({
    super.key,
    this.top = CustomSizes.outerContainerPositionedTop,
    this.left = CustomSizes.outerContainerPositionedLeft
  });

  final double? top, left;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Positioned(
        top: top,
        left: left,
        child: Material(

            child: Container(
              height: CustomSizes.outerContainerHeight,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(CustomSizes.outerContainerRadius),
                  boxShadow: [
                    BoxShadow(
                        color: CustomColors.darkerGrey.withOpacity(0.3),
                        offset: const Offset(CustomSizes.outerContainerOffsetX, CustomSizes.outerContainerOffsetY),
                        blurRadius: CustomSizes.outerContainerBlurRadius,
                        spreadRadius: CustomSizes.outerContainerSpreadRadius
                    )
                  ]
              ),
            )
        )
    );
  }
}