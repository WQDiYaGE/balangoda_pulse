import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.backgroundColor = Colors.transparent
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading:showBackArrow
            ?IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
            :leadingIcon != null?IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            :null,
        automaticallyImplyLeading: false,
        title: title,
        actions: actions,
        backgroundColor: backgroundColor
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}