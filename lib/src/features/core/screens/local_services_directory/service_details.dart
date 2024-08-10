import 'package:balangoda_pulse/src/common/widgets/texts/section_heading.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_meta_data.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';

import 'widgets/ratings_and_share_widget.dart';
import 'widgets/custom_service_image_slider.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Service Image Slider
            const CustomServiceImageSlider(), // Placeholder for image slider

            // -- Service Details
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.defaultSpace, right: CustomSizes.defaultSpace, bottom: CustomSizes.defaultSpace),
              child: Column(
                children: [
                  // -- Ratings & Share Buttons
                  const RatingsAndShareWidget(),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  // -- Service Provider Info
                  const ServiceMetaData(),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  // -- Description
                  const SectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added. But I was confused.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)
                  ),
                  // -- Reviews
                  const Divider(),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ]
                  ),
                  const SizedBox(height: CustomSizes.spaceBetweenSections)


                ],
              ),
            )

          ]
        )
      ),
    );
  }
}




