import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/primary_header_container.dart';
import 'package:balangoda_pulse/src/features/personalization/screens/settings/privacy_settings/data_sharing_preferences_screen.dart';
import 'package:balangoda_pulse/src/features/personalization/screens/settings/privacy_settings/privacy_policy_screen.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/welcome_screen/welcome_screen.dart';
import '../../../core/screens/profile/profile_screen.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.spaceBetweenSections),
                  UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: CustomSizes.spaceBetweenSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: CustomSizes.paddingSpecial,
                horizontal: CustomSizes.paddingSpecial,
              ),
              child: Column(
                children: [
                  // -- Notification Settings
                  const SectionHeading(title: 'Notification Settings'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  const SectionHeading(title: 'Push Notifications'),
                  SettingsMenuTile(
                      icon: Iconsax.notification_bing,
                      title: 'News Updates',
                      subTitle: 'Enable/disable news updates',
                      trialing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(
                      icon: Iconsax.global_edit,
                      title: 'Community Updates',
                      subTitle: 'Enable/disable community updates',
                      trialing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(
                      icon: Iconsax.warning_2,
                      title: 'Emergency Alerts',
                      subTitle: 'Enable/disable emergency alerts',
                      trialing: Switch(value: true, onChanged: (value) {})),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(
                      icon: Iconsax.notification_1,
                      title: 'Email Notifications',
                      subTitle: 'Manage email notifications',
                      trialing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(
                      icon: Iconsax.sms,
                      title: 'SMS Alerts',
                      subTitle: 'Manage SMS alerts',
                      trialing: Switch(value: true, onChanged: (value) {})),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- Privacy Settings
                  const SectionHeading(title: 'Privacy Settings'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(icon: Iconsax.shield, title: 'Privacy Policy', subTitle: 'View our privacy policy', onTap: () {
                    Get.to(() => const PrivacyPolicyScreen());
                  }),
                  SettingsMenuTile(icon: Iconsax.security, title: 'Data Sharing Preferences', subTitle: 'Control data sharing options', onTap: () {
                    Get.to(() => const DataSharingPreferencesScreen());
                  }),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- Language Preferences
                  const SectionHeading(title: 'Language Preferences'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(icon: Iconsax.language_circle, title: 'Language Selection', subTitle: 'Choose your preferred language', onTap: () {}),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- App Theme
                  const SectionHeading(title: 'App Theme'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(icon: Iconsax.brush_1, title: 'Theme Selection', subTitle: 'Switch between light and dark mode', onTap: () {}),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- Feedback & Support
                  const SectionHeading(title: 'Feedback & Support'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(icon: Iconsax.headphone, title: 'Contact Support', subTitle: 'Get help and support', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.message_text, title: 'Submit Feedback', subTitle: 'Send us your feedback', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.info_circle, title: 'FAQs', subTitle: 'Frequently asked questions', onTap: () {}),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- App Information
                  const SectionHeading(title: 'App Information'),
                  const SizedBox(height: CustomSizes.spaceBetweenItems),
                  SettingsMenuTile(icon: Iconsax.info_circle, title: 'About Us', subTitle: 'Learn more about us', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.document, title: 'Terms & Conditions', subTitle: 'Read our terms and conditions', onTap: () {}),

                  const SizedBox(height: CustomSizes.spaceBetweenSections),

                  // -- Account Management
                  SettingsMenuTile(
                      icon: Iconsax.logout, title: 'Log Out', subTitle: 'Sign out of your account', onTap: () async {
                    await AuthenticationRepository().logout();
                    Get.offAll(() => const WelcomeScreen());
                  }),
                  SettingsMenuTile(icon: Iconsax.trash, title: 'Delete Account', subTitle: 'Request account deletion', onTap: () {
                    // Handle account deletion request
                  }),

                  const SizedBox(height: CustomSizes.spaceBetweenSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
