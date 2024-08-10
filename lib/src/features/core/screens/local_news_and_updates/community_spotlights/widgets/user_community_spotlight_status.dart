import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/models/community_spotlight_model.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/community_spotlight_detail_screen.dart'; // Import GetX


class UserCommunitySpotlightStatus extends StatelessWidget {
  final CommunitySpotlightModel spotlight;

  const UserCommunitySpotlightStatus({
    super.key,
    required this.spotlight,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spotlight.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                '${spotlight.date.toLocal()}'.split(' ')[0],
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                spotlight.description,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        // Handle the tap event if needed
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunitySpotlightDetailScreen(
              spotlight: spotlight,
            ),
          ),
        );
      },
    );
  }
}
