import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.width = 56.0,
    this.height = 56.0,
    this.padding = CustomSizes.small,
    this.backgroundColor,
    this.boxFit = BoxFit.cover,
    this.isNetworkImage = false,
    required this.imageUrl,
    this.overlayColor
  });

  final double width, height;
  final double padding;
  final Color? backgroundColor;
  final BoxFit? boxFit;
  final bool isNetworkImage;
  final String imageUrl;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (HelperFunctions.isDarkMode(context) ? CustomColors.black : CustomColors.white),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Image(
          fit: boxFit,
          image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          color: overlayColor
      )
    );
  }
}
