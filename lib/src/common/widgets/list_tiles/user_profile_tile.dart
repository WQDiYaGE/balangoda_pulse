import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../custom/custom_circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CustomCircularImage(
            width: CustomSizes.userProfileWidth,
            height: CustomSizes.userProfileHeight,
            padding: 0,
            imageUrl: CustomImageStrings.userIcon
        ),
        title: Text(CustomTextStrings.username, style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.white)),
        subtitle: Text(CustomTextStrings.emailAddress, style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.white)),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(Iconsax.edit, color: CustomColors.white)
        )
    );
  }
}