import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'card_container.dart';

class InnerContainer extends StatelessWidget {
  const InnerContainer({
    super.key,
    this.height = CustomSizes.innerContainerHeight,
    this.width = CustomSizes.innerContainerWidth,
    this.backgroundColor = CustomColors.lightColor,
    required this.customImageUrl,
  });

  final double height, width;
  final Color backgroundColor;
  final String customImageUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: CustomSizes.innerContainerPositionedTop,
        left: CustomSizes.innerContainerPositionedLeft,
        child: Card(
            elevation: 10.0,
            shadowColor: CustomColors.darkGrey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CustomSizes.innerContainerRadius)
            ),
            child: CardContainer(
              height: height,
              width: width,
              backgroundColor: backgroundColor,
              customImageUrl: customImageUrl
            )
        )
    );
  }
}

