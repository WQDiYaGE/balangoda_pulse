import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/circular_container.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
          label: isColor ? const SizedBox() : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(color: selected ? CustomColors.white : null),
          avatar: isColor ? CircularContainer(width: 50, height: 50, backgroundColor: HelperFunctions.getColor(text)!) : null,
          shape: isColor ? const CircleBorder() : null,
          labelPadding: isColor ? const EdgeInsets.all(0) : null,
          padding: isColor ? const EdgeInsets.all(0) : null,
          backgroundColor: isColor ? HelperFunctions.getColor(text)! : null
      ),
    );
  }
}
