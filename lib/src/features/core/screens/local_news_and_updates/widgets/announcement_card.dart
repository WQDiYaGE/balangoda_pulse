import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.readMoreUrl
  });

  final String title;
  final String description;
  final String date;
  final String readMoreUrl;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Handle read more action
      },
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(CustomSizes.paddingSpecial),
        margin: const EdgeInsets.only(bottom: CustomSizes.defaultSpace),
        decoration: BoxDecoration(
          color: dark ? CustomColors.darkerGrey : CustomColors.white,
          borderRadius: BorderRadius.circular(CustomSizes.featureRadius),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: CustomSizes.small),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: CustomSizes.small),
            Text(
              date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CustomSizes.small),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to full announcement
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
