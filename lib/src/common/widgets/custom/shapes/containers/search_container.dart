import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utils.dart';
import '../../../../../utils/helper/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const  SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.onTap,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: DeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(CustomSizes.medium),
            decoration: BoxDecoration(
                color: showBackground ? dark ? CustomColors.darkColor : CustomColors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(CustomSizes.borderRadiusLarge),
                border: showBorder ? Border.all(color: CustomColors.grey) : null
            ),
            child: Row(
                children: [
                  Icon(icon, color: CustomColors.darkerGrey),
                  const SizedBox(width: CustomSizes.spaceBetweenItems),
                  Text(text, style: Theme.of(context).textTheme.bodyLarge)
                ]
            )
        ),
      ),
    );
  }
}