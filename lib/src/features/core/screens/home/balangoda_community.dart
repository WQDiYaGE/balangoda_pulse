import 'package:flutter/material.dart';

import '../../../../common/widgets/sliders/vertical_image_slider.dart';
import '../../../../utils/constants/image_strings.dart';

class BalangodaCommunity extends StatelessWidget {
  const BalangodaCommunity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 9,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return VerticalImageSlider(
                  image: CustomImageStrings.userIcon,
                  title:'Kevin Hewage',
                  onTap: () {}
              );
            }
        )
    );
  }
}