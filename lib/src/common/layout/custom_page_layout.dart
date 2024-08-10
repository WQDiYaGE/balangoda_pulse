import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomPageLayout extends StatelessWidget {
  const CustomPageLayout({
    super.key,
    this.mainAxisExtent = 310.0,
    required this.itemBuilder,
    required this.itemCount
  });


  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
              height: mainAxisExtent,
              margin: const EdgeInsets.only(
                  bottom: CustomSizes.gridViewSpacing
              ),
              child: itemBuilder(context, index)
          );
        }
    );
  }
}
