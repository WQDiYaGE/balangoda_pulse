import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.price,
    this.maxLines = 1,
    this.textStyle,
  });

  final String price;
  final int maxLines;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(price, maxLines: maxLines, overflow: TextOverflow.ellipsis, style: textStyle ?? Theme.of(context).textTheme.headlineMedium);
  }
}