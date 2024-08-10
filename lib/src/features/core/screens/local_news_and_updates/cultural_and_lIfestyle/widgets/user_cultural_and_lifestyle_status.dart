import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_status/details_screens/cultural_and_lifestyle_detail_screen.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/cultural_and_lifestyle_model.dart';


class UserCulturalAndLifestyleStatus extends StatelessWidget {
  final CulturalAndLifestyleModel culturalAndLifestyle;

  const UserCulturalAndLifestyleStatus({
    super.key,
    required this.culturalAndLifestyle,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CulturalAndLifestyleDetailScreen(
              culturalAndLifestyle: culturalAndLifestyle,
            ),
          ),
        );
      },
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
                      culturalAndLifestyle.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      culturalAndLifestyle.dateTime.toLocal().toString().split(' ')[0],
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                        culturalAndLifestyle.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        )
                    )
                  ]
              )
          )
      ),
    );
  }
}
