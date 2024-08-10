import 'package:balangoda_pulse/src/common/widgets/custom/custom_circular_image.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/custom_rounded_container.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../texts/enums.dart';
import '../texts/feature_heading_with_verified_icon.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    this.onTap,
    this.showBorder = false
  });

  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedContainer(
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(CustomSizes.small),
          child: Row(
              children: [
                Flexible(
                  child: CustomCircularImage(
                      backgroundColor: Colors.transparent,
                      isNetworkImage: false,
                      imageUrl: CustomImageStrings.communityTesting,
                      overlayColor: HelperFunctions.isDarkMode(context) ? CustomColors.white : CustomColors.black
                  ),
                ),
                const SizedBox(width: CustomSizes.spaceBetweenItems / 2),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FeatureHeadingWithVerifiedIcon(title: 'Nike', featureTextSizes: TextSizes.large),
                        Text(
                            '256 products',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium
                        )
                      ]
                  ),
                )
              ]
          )

      ),
    );
  }
}
