import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../curved_edges/custom_curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
        color: CustomColors.primaryColor2,
        child: Stack(
            children: [
              Positioned(top: -100, right: -150, child: CircularContainer(backgroundColor: secondaryColor.withOpacity(0.1))),
              Positioned(top: 50, right: -250, child: CircularContainer(backgroundColor: secondaryColor.withOpacity(0.1))),
              child
            ]
        ),
      )
    );
  }
}
