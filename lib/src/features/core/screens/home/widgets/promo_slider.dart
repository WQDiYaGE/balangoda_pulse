import 'package:balangoda_pulse/src/features/core/controllers/home_controller.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom/shapes/containers/circular_container.dart';
import '../../../../../common/widgets/sliders/roundered_banners.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
        children: [
          CarouselSlider(
              items: banners.map((url) =>
                      RoundedBanners(imageUrl: url)
              ).toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index)
              )
          ),
          const SizedBox(height: 8),
          Center(
            child: Obx(
                () => Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i = 0; i < banners.length; i++)
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