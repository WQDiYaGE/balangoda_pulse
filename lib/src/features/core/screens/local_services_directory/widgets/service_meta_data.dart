import 'package:balangoda_pulse/src/common/widgets/texts/enums.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/brand_title_with_verified_icon.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ServiceMetaData extends StatelessWidget {
  const ServiceMetaData({
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- Service Logo
        Container(
          width: CustomSizes.serviceLogoWidth, // Set appropriate width
          height: CustomSizes.serviceLogoHeight, // Set appropriate height
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle, // You can change this to BoxShape.rectangle if you prefer
            image: DecorationImage(
              image: AssetImage(CustomImageStrings.logoBankOfCeylon), // Replace with the actual path to the service logo
              fit: BoxFit.cover, // Adjust to fit the container
            ),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        // -- Service Provider Info
        const BrandTitleWithVerifiedIcon(
          title: 'Bank Of Ceylon - Balangoda Branch', // Replace with actual service provider name
          textSize: TextSizes.medium,
        ),

        // -- Service Category
        Row(
          children: [
            const Icon(
                Icons.business, // Replace with an actual category icon
                color: CustomColors.primaryColor2
            ),
            const SizedBox(width: CustomSizes.small),
            Text(
              'Banking & Finance', // Replace with actual service category
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)
            )
          ]
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        // -- Availability Status
        Row(
            children: [
              const Icon(
                Icons.access_time,
                color: CustomColors.primaryColor,
                size: 20
              ),
              const SizedBox(width: CustomSizes.small),
              Text(
                'Open Now', // Replace with actual service availability status
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.green, // Indicating open status
                  fontWeight: FontWeight.bold
                )
              )
            ]
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        // -- Phone Number
        Row(
          children: [
            const Icon(
              Icons.phone_outlined,
              color: CustomColors.primaryColor,
              size: 20
            ),
            const SizedBox(width: CustomSizes.small),
            Text(
              '+94 45 22 89 390', // Replace with actual phone number
              style: Theme.of(context).textTheme.bodyMedium
            )
          ]
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        Row(
            children: [
              const Icon(
                  Icons.email_outlined,
                  color: CustomColors.primaryColor,
                  size: 20
              ),
              const SizedBox(width: CustomSizes.small),
              Text(
                  'boc688@boc.lk', // Replace with actual email address
                  style: Theme.of(context).textTheme.bodyMedium
              )
            ]
        ),
        const SizedBox(height: CustomSizes.spaceBetweenItems),

        // -- Service Location
        Row(
            children: [
              const Icon(
                  Icons.location_on_outlined,
                  color: CustomColors.primaryColor,
                  size: 20
              ),
              const SizedBox(width: CustomSizes.small),
              Text(
                  'Near the Bus Stand, Balangoda', // Replace with actual service location
                  style: Theme.of(context).textTheme.bodyMedium
              )
            ]
        )


      ],
    );
  }
}
