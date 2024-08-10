import 'package:balangoda_pulse/src/features/core/screens/home/widgets/text_widgets/expanded_inside_container_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';

class ExpandedContainerTextWidget extends StatelessWidget {
  const ExpandedContainerTextWidget({
    super.key,
    required this.heading,
    required this.subHeading
  });

  final String heading, subHeading;


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpandedInsideContainerTextWidget(
              heading: heading,
              fontSize: CustomSizes.expandedContainerHeading
          ),
          const SizedBox(height: CustomSizes.expandedContainerTextSpace),
          ExpandedInsideContainerTextWidget(
              heading: subHeading,
              fontSize: CustomSizes.expandedContainerSubHeading,
              applyFontWeight: true
          )
        ]
    );
  }
}

