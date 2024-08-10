import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/development_projects/widgets/development_project_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/development_projects/widgets/development_project_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/development_project_model.dart';

class DevelopmentProjectFormScreen extends StatelessWidget {
  const DevelopmentProjectFormScreen({
    super.key,
    this.developmentProject,
  });

  final DevelopmentProjectModel? developmentProject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DevelopmentProjectFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Development Project',
                  subTitle: 'Fill in the details below to create a development project',
                ),
                DevelopmentProjectFormWidget(developmentProject: developmentProject),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
