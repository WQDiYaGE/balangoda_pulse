import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/custom_rounded_container.dart';
import 'package:balangoda_pulse/src/common/widgets/texts/section_heading.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_price_text.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_title_text.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/custom_choice_chip.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ServiceAttributes extends StatelessWidget {
  const ServiceAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // -- Selected attribute Pricing & Description
        CustomRoundedContainer(
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.grey,
          child: Column(
            children: [
              // -- Title, Price and Stack Status
              Row(
                children: [
                  const SectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: CustomSizes.spaceBetweenItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ServiceTitleText(title: 'Price: ', smallSize: true),

                          // -- Actual Price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: CustomSizes.spaceBetweenItems),

                          // -- Sale Price
                          const ServicePriceText(price: '20')
                        ]
                      ),

                      // -- Stack
                      Row(
                        children: [
                          const ServiceTitleText(title: 'Stack: ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
                        ]
                      ),

                      // -- Variation Description
                      const ServiceTitleText(
                          title: 'This is the description of the Product and it can go up to max 4 lines',
                          smallSize: true,
                          maxLines: 4
                      )
                    ]
                  )
                ]
              )
            ]
          )
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        // -- Attributes
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: CustomSizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                CustomChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                CustomChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {})
              ]
            )
          ]
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: CustomSizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                CustomChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                CustomChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
                CustomChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                CustomChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {})
              ]
            )
          ]
        )

      ]
    );
  }
}

