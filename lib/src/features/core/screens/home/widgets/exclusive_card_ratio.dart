import 'package:balangoda_pulse/src/features/core/controllers/home_controller.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom/shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';

class ExclusiveCardRatio extends StatelessWidget {
  const ExclusiveCardRatio({
    super.key,
    required this.cards
  });

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
            items: cards,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)
            )
        ),
        const SizedBox(height: CustomSizes.spaceBetweenCarouselSliderAndDotsIndicators),
        Center(
          child: Obx(
                () => Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  for(int i = 0; i < cards.length; i++)
                    CircularContainer(
                        width: CustomSizes.bannerDotsWidth,
                        height: CustomSizes.bannerDotsHeight,
                        margin: const EdgeInsets.only(right: CustomSizes.marginSpecial),
                        backgroundColor: controller.carouselCurrentIndex.value == i ? CustomColors.primaryColor : CustomColors.grey
                    )
                ]
            ),
          ),
        )
      ]
    );
  }
}
