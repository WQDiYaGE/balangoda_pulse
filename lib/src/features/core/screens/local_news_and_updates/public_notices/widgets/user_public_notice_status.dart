import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/public_notice_model.dart';
import '../../../../../admin/screens/content_management_interface/widgets/content_status/details_screens/public_notice_detail_screen.dart';


class UserPublicNoticeStatus extends StatelessWidget {
  final PublicNoticeModel notice;

  const UserPublicNoticeStatus({
    super.key,
    required this.notice,
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
                notice.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
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
