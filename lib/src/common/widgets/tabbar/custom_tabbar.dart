import 'package:balangoda_pulse/src/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    // Using Material widget, You can add the background color to tabs, wrapping TabBar
    return Material(
      color: dark ? CustomColors.black : CustomColors.white,
      child: TabBar(
          isScrollable: true,
          labelColor: HelperFunctions.isDarkMode(context) ? CustomColors.white : CustomColors.primaryColor,
          labelStyle: const TextStyle(color: CustomColors.black, fontSize: CustomSizes.fontSizeMedium, fontStyle: FontStyle.normal),
          indicatorColor: CustomColors.primaryColor,
          unselectedLabelColor: CustomColors.darkGrey,
          tabs: tabs
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppbarHeight());
}