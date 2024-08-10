import 'package:balangoda_pulse/src/common/styles/shadow_styles.dart';
import 'package:balangoda_pulse/src/common/widgets/icons/circular_icon.dart';
import 'package:balangoda_pulse/src/common/widgets/sliders/roundered_banners.dart';
import 'package:balangoda_pulse/src/common/widgets/texts/feature_heading.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../texts/enums.dart';
import '../../texts/feature_heading_with_verified_icon.dart';
import '../shapes/containers/custom_rounded_container.dart';
import 'price_tag.dart';

class CustomCardVertical extends StatelessWidget {
  const CustomCardVertical({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(CustomSizes.paddingSpecial),
        decoration: BoxDecoration(
          color: dark ? CustomColors.darkerGrey: CustomColors.white,
          borderRadius: BorderRadius.circular(CustomSizes.featureRadius),
          boxShadow: [ShadowStyles.verticalFeatureShadowStyle]
        ),
        child: Column(
          children: [
            CustomRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(CustomSizes.small),
              backgroundColor: dark ? CustomColors.darkColor : CustomColors.lightColor,
              child: Stack(
                children: [
                  const RoundedBanners(
                      imageUrl: CustomImageStrings.underReview,
                      applyImageRadius: true
                  ),
                  Positioned(
                    top: 12,
                    child: CustomRoundedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.small, vertical: CustomSizes.xs),
                      backgroundColor: CustomColors.secondaryColor.withOpacity(CustomSizes.defaultOpacity),
                      radius: CustomSizes.small,
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.black)),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                          icon: Iconsax.heart5,
                          color: Colors.red
                      )
                  )
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.featureSpace),

            // -- Details
            const Padding(
              padding: EdgeInsets.only(left: CustomSizes.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureHeading(title: 'Green Nike Air Shoes', featureTextSize: TextSizes.small),
                  SizedBox(height: CustomSizes.featureSpace),
                  FeatureHeadingWithVerifiedIcon(title: 'Nike')

                ]
              )
            ),
            const Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: CustomSizes.small),
                      child: PriceTag(price: '35.0')
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: CustomColors.darkColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.featureRadius1),
                              bottomRight: Radius.circular(CustomSizes.featureRadius)
                          )
                      ),
                      child: const SizedBox(
                          width: CustomSizes.iconLarge * 1.2,
                          height: CustomSizes.iconLarge * 1.2,
                          child: Center(
                            child: Icon(
                                Iconsax.add,
                                color: CustomColors.white
                            ),
                          )
                      )
                  )
                ]
            )

          ]
        )
      ),
    );
  }
}