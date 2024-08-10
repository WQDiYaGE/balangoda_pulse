import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trialing,
    this.onTap

  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trialing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
          icon,
          size: CustomSizes.defaultIconSize,
          color: CustomColors.primaryColor
      ),
      title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge
      ),
      subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.labelSmall
      ),
      trailing: trialing,
      onTap: onTap,
    );
  }
}
