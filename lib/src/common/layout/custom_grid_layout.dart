import 'package:flutter/material.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
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
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.0, // CustomSizes.gridViewSpacing
            crossAxisSpacing: 10.0, // CustomSizes.gridViewSpacing
            mainAxisExtent: mainAxisExtent
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount
    );
  }
}
