import 'package:balangoda_pulse/src/common/layout/custom_grid_layout.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/cards/custom_card_vertical.dart';
import 'package:balangoda_pulse/src/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import 'feature_showcase.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
                children: [
                  const FeatureShowcase(images: [ CustomImageStrings.special, CustomImageStrings.special, CustomImageStrings.special]),
                  const FeatureShowcase(images: [ CustomImageStrings.special, CustomImageStrings.special, CustomImageStrings.special]),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),

                  const SectionHeading(title: 'You might like'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),

                  CustomGridLayout(itemBuilder: (_, index) => const CustomCardVertical(), itemCount: 7)
                ]
            )
        )
      ]
    );
  }
}
