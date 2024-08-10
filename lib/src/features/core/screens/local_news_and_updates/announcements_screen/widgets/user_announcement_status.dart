import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/announcement_model.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/announcement_detail_screen.dart';


class UserAnnouncementStatus extends StatelessWidget {
  const UserAnnouncementStatus({super.key, required this.announcement});

  final AnnouncementModel announcement;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'announcement_${announcement.id}', // Ensure this is unique
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
                  announcement.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                  ),
                ),
                const SizedBox(height: CustomSizes.small),
                Text(
                  announcement.dateTime.toLocal().toString().split(' ')[0],
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: CustomSizes.small),
                Divider(color: Colors.grey[300]),
                const SizedBox(height: CustomSizes.small),
                Text(
                  announcement.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnnouncementDetailScreen(announcement: announcement),
          ),
        );
      },
    );
  }
}

