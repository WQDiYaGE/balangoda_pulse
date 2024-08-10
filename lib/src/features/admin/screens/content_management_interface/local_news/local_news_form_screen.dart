import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/local_news/widgets/local_news_form_header_widget.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/local_news/widgets/local_news_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/local_news_model.dart';

class LocalNewsFormScreen extends StatelessWidget {
  const LocalNewsFormScreen({
    super.key,
    this.localNews,
  });

  final LocalNewsModel? localNews;

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
                const LocalNewsFormHeaderWidget(
                  image: 'assets/images/community-cohesion.png',
                  title: 'Create Local News',
                  subTitle: 'Fill in the details below to create a local news article',
                ),
                LocalNewsFormWidget(localNews: localNews),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
