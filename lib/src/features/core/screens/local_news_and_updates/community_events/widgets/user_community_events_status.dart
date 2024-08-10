import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/community_event_model.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/community_event_detail_screen.dart';

class UserCommunityEventStatus extends StatelessWidget {
  const UserCommunityEventStatus({super.key, required this.event});

  final CommunityEventModel event;

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
                event.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                '${event.dateTime.toLocal()}'.split(' ')[0],
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: CustomSizes.small),
              Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black54,
                  )
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                'Location: ${event.location}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                'Organizer: ${event.organizer}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommunityEventDetailScreen(event: event)
          ),
        );
      },
    );
  }
}
