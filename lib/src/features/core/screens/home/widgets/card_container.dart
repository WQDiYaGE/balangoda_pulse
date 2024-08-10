import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    this.borderRadius = CustomSizes.innerContainerRadius,
    required this.customImageUrl
  });

  final double height, width;
  final Color backgroundColor;
  final double borderRadius;
  final String customImageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(customImageUrl)
          )
      ),
    );
  }
}