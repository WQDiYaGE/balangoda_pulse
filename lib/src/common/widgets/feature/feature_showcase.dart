import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom/shapes/containers/custom_rounded_container.dart';

class FeatureShowcase extends StatelessWidget {
  const FeatureShowcase({
    super.key,
    required this.images
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
        padding: const EdgeInsets.all(CustomSizes.medium),
        margin: const EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems),
        backgroundColor: Colors.transparent,
        showBorder: true,
        borderColor: CustomColors.darkGrey,
        child: Column(
            children: [
              // const FeatureCard(showBorder: false),
              const SizedBox(height: CustomSizes.spaceBetweenItems),

              Row(children: images.map((image) => featureDescriptiveWidget(image, context)).toList())
            ]
        )
    );
  }

  Widget featureDescriptiveWidget(String image, context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Expanded(
      child: CustomRoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(CustomSizes.medium),
          margin: const EdgeInsets.only(right: CustomSizes.small),
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.lightColor,
          child: const Image(
              image: AssetImage(CustomImageStrings.special),
              fit: BoxFit.contain
          )
      ),
    );
  }
}