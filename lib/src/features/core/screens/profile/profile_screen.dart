import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:balangoda_pulse/src/common/widgets/texts/section_heading.dart';
import 'package:balangoda_pulse/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom/custom_circular_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Profile'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                // -- Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const CustomCircularImage(
                          width: CustomSizes.userProfileWidthChanged,
                          height: CustomSizes.userProfileHeightChanged,

                          imageUrl: CustomImageStrings.userIcon
                      ),
                      TextButton(onPressed: () {}, child: const Text('Change Profile Picture'))
                    ]
                  )
                ),

                const SizedBox(height: CustomSizes.spaceBetweenItems / 2),

                const Divider(),

                // -- Details
                const SizedBox(height: CustomSizes.spaceBetweenItems),

                // -- Profile Info
                const SectionHeading(title: 'Profile Information'),
                const SizedBox(height: CustomSizes.spaceBetweenItems),

                ProfileMenu(title: 'Name', value: 'Sandaruwan Wadiyage', onPressed: () {}),
                ProfileMenu(title: 'Username', value: 'Sandaruwan Wadiyage', onPressed: () {}),

                const SizedBox(height: CustomSizes.spaceBetweenItems),
                const Divider(),
                const SizedBox(height: CustomSizes.spaceBetweenItems),

                // -- Personal Info
                const SectionHeading(title: 'Personal Information'),
                const SizedBox(height: CustomSizes.spaceBetweenItems),

                ProfileMenu(title: 'User ID', value: '45889', icon: Iconsax.copy, onPressed: () {}),
                ProfileMenu(title: 'E-mail', value: 'Wadiyage567@gmail.com', onPressed: () {}),
                ProfileMenu(title: 'Phone Number', value: '+94 77 80 51 829', onPressed: () {}),
                ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                ProfileMenu(title: 'Date Of Birth', value: 'July 16, 1997', onPressed: () {}),
                const Divider(),
                const SizedBox(height: CustomSizes.spaceBetweenItems),
                
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Close Account', style: TextStyle(color: Colors.red))
                  )
                )
              ]
            )
        )
      )
    );
  }
}


