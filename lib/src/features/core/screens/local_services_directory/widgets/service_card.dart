import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/service_details.dart';
import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/custom_rounded_container.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  final void Function()? onTap;
  final bool showBorder;

  const ServiceCard({
    super.key,
    this.onTap,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.to(() => const ServiceDetails());
      },
      child: CustomRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(CustomSizes.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Service Icon or image
            ClipRRect(
              borderRadius: BorderRadius.circular(CustomSizes.featureRadius),
              child: Image.asset(
                CustomImageStrings.underReview,
                fit: BoxFit.cover,
                width: 50,
                height: 50
              )
            ),
            const SizedBox(width: CustomSizes.spaceBetweenItems / 2),

            // Service Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Bank Of Ceylon – Balangoda', // Replace with the actual service name
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis
                  ),
                ),
                // -- Ratings & Reviews
                // Row(
                //   children: [
                //     const Icon(
                //         Icons.star,
                //         color: Colors.amber,
                //         size: 18
                //     ),
                //     const SizedBox(height: CustomSizes.spaceBetweenRatingsAndReviews),
                //     Text(
                //         "4.5 (200 reviews)", // Replace with the actual rating and number of reviews
                //         style: Theme.of(context).textTheme.bodyText2
                //     )
                //   ],
                // )
              ],
            ),
            const SizedBox(height: CustomSizes.small),

            // Service Category Icon and Name
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.business, // Replace with the actual category icon
                  color: CustomColors.primaryColor2
                ),
                const SizedBox(width: CustomSizes.small),
                Text(
                  'Banking & Finance', // Replace with the actual category name
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700
                  )
                )
              ]
            ),
            const SizedBox(height: CustomSizes.small),

            // Brief Description
            Text(
              'Leading bank in Balangoda.', // Replace with the actual brief description
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),


            const SizedBox(height: CustomSizes.small),

            // Distance from User's Location
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: CustomColors.primaryColor,
                  size: 18
                ),
                const SizedBox(width: CustomSizes.small),
                Text(
                  '2.5 km away', // Replace with the actual distance
                  style: Theme.of(context).textTheme.bodyMedium
                )
              ],
            ),
            const SizedBox(height: CustomSizes.small),

            // "Open Now" Indicator
            Text(
              'Open Now', // Replace with the actual open status
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.green, // Indicating open status
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
      ),
    );
  }
}
