import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/custom/custom_rounded_image.dart';
import '../../../../../common/widgets/custom/shapes/curved_edges/custom_curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class CustomServiceImageSlider extends StatelessWidget {
  const CustomServiceImageSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return CustomCurvedEdgesWidget(
      child: Container(
        color: dark ? CustomColors.darkerGrey : CustomColors.lightGrey,
        child: Stack(
            children: [
              // Main Large Image
              const SizedBox(
                height: CustomSizes.serviceImageHeight,
                child: Padding(
                  padding: EdgeInsets.all(CustomSizes.serviceImageRadius * 2),
                  child: Center(
                      child: Image(
                          image: AssetImage(CustomImageStrings.underReview)
                      )
                  ),
                ),
              ),

              // Image Slider
              Positioned(
                right: 0,
                bottom: 30.0,
                child: SizedBox(
                  height: CustomSizes.serviceImagesHeight,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) => CustomRoundedImage(
                          width: CustomSizes.serviceImagesWidth,
                          backgroundColor: dark ? CustomColors.darkColor : CustomColors.white,
                          border: Border.all(color: CustomColors.primaryColor),
                          padding: const EdgeInsets.all(CustomSizes.small),
                          imageUrl: CustomImageStrings.underReview
                      ),
                      separatorBuilder: (_, __) => const SizedBox(width: CustomSizes.spaceBetweenItems),
                      itemCount: 4
                  ),
                ),
              ),

              // Appbar Icons
              const CustomAppBar(
                  showBackArrow: true,
                  actions: [
                    CircularIcon(icon: Iconsax.heart5, color: Colors.red)
                  ]
              )
            ]
        ),
      ),
    );
  }
}