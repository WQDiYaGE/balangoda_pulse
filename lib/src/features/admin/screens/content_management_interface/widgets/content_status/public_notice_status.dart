import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/public_notice_controller.dart';
import '../../../../models/public_notice_model.dart';
import '../../public_notices/public_notice_form_screen.dart';
import 'details_screens/public_notice_detail_screen.dart';

class PublicNoticeStatus extends StatelessWidget {
  final PublicNoticeModel notice;

  const PublicNoticeStatus({
    super.key,
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    final PublicNoticeController controller = Get.put(PublicNoticeController());

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
                      notice.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
                              builder: (context) => PublicNoticeFormScreen(publicNotice:  notice),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          await controller.deletePublicNotice(notice.id!);
                        },
                        icon: const Icon(Icons.delete_outlined),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.small),
              Text(
                notice.dateTime.toLocal().toString().split(' ')[0],
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: CustomSizes.small),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: CustomSizes.small),
              Text(
                notice.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublicNoticeDetailScreen(notice: notice),
          ),
        );
      },
    );
  }
}
