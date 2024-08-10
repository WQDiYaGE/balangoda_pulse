import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../models/cultural_and_lifestyle_model.dart';

class CulturalAndLifestyleDetailScreen extends StatelessWidget {
  final CulturalAndLifestyleModel culturalAndLifestyle;

  const CulturalAndLifestyleDetailScreen({super.key, required this.culturalAndLifestyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(culturalAndLifestyle.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              culturalAndLifestyle.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: CustomSizes.medium),
            Text(
              'Date: ${culturalAndLifestyle.dateTime.toLocal()}'.split(' ')[0],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: CustomSizes.small),
            Text(
              culturalAndLifestyle.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: CustomSizes.medium),
            if (culturalAndLifestyle.relatedMedia != null && culturalAndLifestyle.relatedMedia!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Related Media:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: CustomSizes.small),
                  // Display related media (images or videos) here
                ],
              ),
            if (culturalAndLifestyle.moreInfoLink != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: CustomSizes.medium),
                  Text(
                    'More Information:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: CustomSizes.small),
                  GestureDetector(
                    onTap: () {
                      // Handle link tap, maybe using url_launcher package
                    },
                    child: Text(
                      culturalAndLifestyle.moreInfoLink!,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: CustomSizes.medium),
            Text(
              'Organizer: ${culturalAndLifestyle.organizer}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
