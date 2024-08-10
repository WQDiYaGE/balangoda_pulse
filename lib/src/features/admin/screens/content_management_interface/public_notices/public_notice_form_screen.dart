import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/public_notices/widgets/public_notice_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/public_notices/widgets/public_notice_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/public_notice_model.dart';

class PublicNoticeFormScreen extends StatelessWidget {
  const PublicNoticeFormScreen({
    super.key,
    this.publicNotice,
  });

  final PublicNoticeModel? publicNotice;

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
                const PublicNoticeFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Public Notice',
                  subTitle: 'Fill in the details below to create a public notice',
                ),
                PublicNoticeFormWidget(publicNotice: publicNotice),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
