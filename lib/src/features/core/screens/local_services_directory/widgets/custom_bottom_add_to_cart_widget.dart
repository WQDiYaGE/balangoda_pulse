import 'package:balangoda_pulse/src/common/widgets/icons/circular_icon.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helper/helper_functions.dart';

class CustomBottomAddToCartWidget extends StatelessWidget {
  const CustomBottomAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace, vertical: CustomSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CustomColors.darkerGrey : CustomColors.lightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLarge),
          topRight: Radius.circular(CustomSizes.cardRadiusLarge)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: CustomColors.darkerGrey,
                  width: 40.0,
                  height: 40.0,
                  color: CustomColors.white
              ),
              const SizedBox(width: CustomSizes.spaceBetweenItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CustomSizes.spaceBetweenItems),
              const CircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: CustomColors.darkerGrey,
                  width: 40.0,
                  height: 40.0,
                  color: CustomColors.white
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CustomSizes.medium),
                backgroundColor: CustomColors.black,
                side: const BorderSide(color: CustomColors.black)
              ),
              child: const Text('Add to Cart')
          )
        ]
      )
    );
  }
}
