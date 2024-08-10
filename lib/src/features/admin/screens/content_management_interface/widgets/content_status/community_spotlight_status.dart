import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/models/community_spotlight_model.dart';
import 'package:get/get.dart'; // Import GetX

import '../../../../controllers/community_spotlight_controller.dart'; // Import the controller
import '../../../../../../utils/constants/sizes.dart';
import '../../community_spotlights/widgets/community_spotlight_form_widget.dart';
import 'details_screens/community_spotlight_detail_screen.dart';

class CommunitySpotlightStatus extends StatelessWidget {
  final CommunitySpotlightModel spotlight;

  const CommunitySpotlightStatus({
    super.key,
    required this.spotlight,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunitySpotlightController());

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      spotlight.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          // Navigate to edit screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CommunitySpotlightFormWidget(
                                  spotlight: spotlight
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          // Call delete functionality
                          await controller.deleteCommunitySpotlight(spotlight.id!);
                        },
                        icon: const Icon(Icons.delete_outlined),
                      ),
                    ],
                  )
                ],
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
