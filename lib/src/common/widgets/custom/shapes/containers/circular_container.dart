import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = CustomSizes.circularWidth,
    this.height = CustomSizes.circularHeight,
    this.margin = const EdgeInsets.all(0),
    this.padding = 0,
    this.radius = CustomSizes.circularRadius,
    this.child,
    this.backgroundColor = CustomColors.secondaryColor
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final double padding;
  final double radius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor
        ),
        child: child
    );
  }
}