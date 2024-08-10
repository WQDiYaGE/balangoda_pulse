import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class VerticalImageSlider extends StatelessWidget {
  const VerticalImageSlider({
    super.key,
    required this.image,
    required this.title,
    this.textColor = CustomColors.white,
    this.backgroundColor = CustomColors.white,
    this.onTap
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CustomSizes.defaultSpace),
        child: Column(
            children: [
              Container(
                  width: CustomSizes.userIconWidth,
                  height: CustomSizes.userIconHeight,
                  decoration: BoxDecoration(
                      color: backgroundColor ?? (dark ? CustomColors.black : CustomColors.white),
                      borderRadius: BorderRadius.circular(CustomSizes.borderRadius)
                  ),
                  child: Center(
                      child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                          color: dark ? CustomColors.lightColor : CustomColors.darkColor
                      )
                  )
              ),
              const SizedBox(height: CustomSizes.spaceBetweenItems/2),
              SizedBox(
                width: CustomSizes.spaceBetweenItems,
                child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),
              )

            ]
        ),
      ),
    );
  }
}