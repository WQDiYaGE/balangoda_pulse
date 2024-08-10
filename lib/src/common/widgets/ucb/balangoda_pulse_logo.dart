import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class BalangodaPULSELogo extends StatelessWidget {
  const BalangodaPULSELogo({
    super.key,
    this.height = CustomSizes.balangodaPULSELogoHeight,
    this.width = CustomSizes.balangodaPULSELogoWidth,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(CustomImageStrings.BalangodaPULSE)
        ),
        // borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}