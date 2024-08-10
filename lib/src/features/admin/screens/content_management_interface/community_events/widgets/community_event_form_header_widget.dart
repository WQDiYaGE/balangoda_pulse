import 'package:flutter/material.dart';

class CommunityEventFormHeaderWidget extends StatelessWidget {
  const CommunityEventFormHeaderWidget({
    super.key,
    this.imageColor,
    this.imageHeight = 0.2,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment,
    this.textAlign
  });

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Image.asset(image, color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
