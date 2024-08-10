
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_showcase.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          Padding(
              padding: EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                  children: [
                    ServiceShowcase(images: [ CustomImageStrings.special, CustomImageStrings.special, CustomImageStrings.special]),
                    ServiceShowcase(images: [ CustomImageStrings.special, CustomImageStrings.special, CustomImageStrings.special]),

                    // SizedBox(height: CustomSizes.spaceBetweenItems),

                    // const SectionHeading(title: 'You might like'),
                    // const SizedBox(height: CustomSizes.spaceBetweenItems),
                    //
                    // CustomGridLayout(itemBuilder: (_, index) => const CustomCardVertical(), itemCount: 7)
                  ]
              )
          )
        ]
    );
  }
}
