import 'package:flutter/material.dart';

class OuterContainerTextWidget extends StatelessWidget {
  const OuterContainerTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight = FontWeight.bold
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight
        )
    );
  }
}