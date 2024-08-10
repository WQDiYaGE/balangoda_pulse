import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_status/details_screens/development_project_detail_screen.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../admin/models/development_project_model.dart';


class UserDevelopmentProjectStatus extends StatelessWidget {
  final DevelopmentProjectModel project;

  const UserDevelopmentProjectStatus({
    super.key,
    required this.project,
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
                      project.projectName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      '${project.startDate.toLocal().toString().split(' ')[0]}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      '${project.location}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                        project.description,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black54,
                        )
                    ),
                    const SizedBox(height: CustomSizes.small),
                    Text(
                      '${project.status}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: project.status == 'Completed' ? Colors.green : (project.status == 'In Progress' ? Colors.orange : Colors.red),
                      ),
                    ),
                  ]
              )
          )
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DevelopmentProjectDetailScreen(
              project: project,
            ),
          ),
        );
      },
    );
  }
}
