import 'package:balangoda_pulse/src/features/admin/controllers/announcement_controller.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/announcements/announcement_form_screen.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_status/details_screens/announcement_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/announcement_model.dart';

class AnnouncementStatus extends StatelessWidget {
  const AnnouncementStatus({super.key, required this.announcement});

  final AnnouncementModel announcement;

  @override
  Widget build(BuildContext context) {
    final AnnouncementController controller = Get.put(AnnouncementController());

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
                      announcement.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnnouncementFormScreen(announcement: announcement)
                                )
                            );
                          },
                          icon: const Icon(Icons.edit_outlined)
                      ),
                      IconButton(
                          color: Colors.red,
                          onPressed: () async {
                            await controller.deleteAnnouncement(announcement.id!);
                          },
                          icon: const Icon(Icons.delete_outlined)
                      )
                    ]
                  )
                ]
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
                )
              )
            ]
          )
        )
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnnouncementDetailScreen(announcement: announcement)
            )
        );
      },
    );
  }
}