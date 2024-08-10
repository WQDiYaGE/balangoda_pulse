import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';

import '../controllers/navigation_menu/navigation_controller.dart';
import 'issue_reporting/issue_reporting_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    final controller = Get.put(NavigationController());

    return Scaffold(
        backgroundColor: isDarkMode ? CustomColors.darkColor : CustomColors.lightColor, // Set the background color
        bottomNavigationBar: Obx(
              () => Container(
            height: CustomSizes.bottomNavBarHeight, // Adjust the height of the bottom navigation bar
            decoration: BoxDecoration(
                color: isDarkMode ? CustomColors.secondaryColor : CustomColors.primaryColor2,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5.0
                  )
                ]
            ),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
              backgroundColor: isDarkMode ? CustomColors.secondaryColor : CustomColors.primaryColor2,
              selectedItemColor: CustomColors.accentColor,
              unselectedItemColor: CustomColors.textSecondary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home, size: 32),
                  label: 'Local News & Updates',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.building_4, size: 32),
                  label: 'Local Services Directory',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.message, size: 32),
                  label: 'Community Forums',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.calendar, size: 32),
                  label: 'Schedule',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting, size: 32),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        floatingActionButton: Stack(
            children: [
              Positioned(
                bottom: CustomSizes.alertFloatingActionButtonPositionedBottom,
                right: CustomSizes.alertFloatingActionButtonPositionedRight,
                child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: isDarkMode ? CustomColors.accentColor : CustomColors.primaryColor,
                    child: const Icon(Iconsax.notification)
                ),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(CustomSizes.borderRadiusIssueReportingForm)
                                ),
                                child: const IssueReportingScreen()
                            );
                          }
                      );
                    },
                    backgroundColor: isDarkMode ? CustomColors.accentColor : CustomColors.primaryColor,
                    child: const Icon(Iconsax.edit)
                ),
              )
            ]
        )
    );
  }
}
