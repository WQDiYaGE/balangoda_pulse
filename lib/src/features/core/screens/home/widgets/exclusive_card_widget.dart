import 'package:balangoda_pulse/src/features/core/screens/home/widgets/text_widgets/outer_container_text_chapter.dart';
import 'package:flutter/material.dart';

import 'inner_container.dart';
import 'outer_container.dart';

class ExclusiveCardWidget extends StatelessWidget {
  const ExclusiveCardWidget({
    super.key,
    required this.customImageUrl,
    required this.heading,
    required this.subHeading
  });

  final String customImageUrl;
  final String heading, subHeading;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const OuterContainer(),
          InnerContainer(
            customImageUrl: customImageUrl,
          ),
          OuterContainerTextChapter(
              heading: heading,
              subHeading: subHeading
          )
        ]
    );
  }
}