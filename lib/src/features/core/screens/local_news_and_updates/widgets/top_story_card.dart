import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TopStoryCard extends StatelessWidget {
  final String title;
  final String summary;
  final String imageUrl;
  final String readMoreUrl;

  const TopStoryCard({
    super.key,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.readMoreUrl,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Handle read more action
      },
      child: Container(
        width: 310, // Adjust the width as needed
        padding: const EdgeInsets.all(CustomSizes.paddingSpecial),
        margin: const EdgeInsets.only(right: CustomSizes.defaultSpace),
        decoration: BoxDecoration(
          color: dark ? CustomColors.darkContainer : CustomColors.lightContainer,
          borderRadius: BorderRadius.circular(CustomSizes.featureRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(CustomSizes.borderRadius),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: CustomSizes.small),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: CustomSizes.small),
            Text(
              summary,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: CustomSizes.small),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to full story
                },
                child: const Text('Read More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
