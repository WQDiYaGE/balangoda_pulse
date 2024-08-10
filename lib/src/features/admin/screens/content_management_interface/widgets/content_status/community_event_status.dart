import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/controllers/community_event_controller.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/community_events/community_event_form_screen.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/community_event_model.dart';
import 'details_screens/community_event_detail_screen.dart';

class CommunityEventStatus extends StatelessWidget {
  const CommunityEventStatus({super.key, required this.event});

  final CommunityEventModel event;

  @override
  Widget build(BuildContext context) {
    final CommunityEventController controller = Get.put(CommunityEventController());

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
                children: [
                  Expanded(
                    child: Text(
                      event.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      )
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommunityEventFormScreen(communityEvent: event),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          await controller.deleteCommunityEvent(event.id!);
                        },
                        icon: const Icon(Icons.delete_outlined),
                      ),
                    ],
                  ),
                ],
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
                event.location,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                event.organizer,
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
