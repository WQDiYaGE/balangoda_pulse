import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/issue_reporting_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/community_events/user_community_events_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/community_spotlights/user_community_spotlights_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/cultural_and_lIfestyle/user_cultural_and_lifestyle_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/development_projects/user_development_projects_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/emergency_alerts/user_emergency_alerts_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/local_news/user_local_news_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/public_notices/user_public_notices_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/widgets/news_category_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:balangoda_pulse/src/features/core/screens/home/widgets/home_app_bar.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom/shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom/shapes/containers/search_container.dart';

import '../../../../utils/constants/sizes.dart';
import 'announcements_screen/user_announcements_screen.dart';

class LocalNewsAndUpdatesScreen extends StatefulWidget {
  const LocalNewsAndUpdatesScreen({super.key});

  @override
  State<LocalNewsAndUpdatesScreen> createState() => _LocalNewsAndUpdatesScreenState();
}

class _LocalNewsAndUpdatesScreenState extends State<LocalNewsAndUpdatesScreen> {
  // final Set<Marker> _markers = {};
  // late GoogleMapController _mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   _mapController = controller;
  //   setState(() {
  //     _markers.add(
  //         const Marker(
  //             markerId: MarkerId('balangoda_center'),
  //             position: LatLng(6.6666, 80.7049), // Coordinates of Balangoda center
  //             infoWindow: InfoWindow(
  //                 title: 'Balangoda Urban Council',
  //                 snippet: 'Center of local governance'
  //             )
  //         )
  //     );
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: SingleChildScrollView(
            child: Column(
                children: [
                  const PrimaryHeaderContainer(
                      child: Column(
                          children: [
                            HomeAppbar(),
                            SizedBox(height: CustomSizes.spaceBetweenSections),

                            SearchContainer(text: 'Search Anything'),
                            SizedBox(height: CustomSizes.spaceBetweenSections),

                            // Residents
                            // Padding(
                            //     padding: EdgeInsets.only(left: CustomSizes.defaultSpace),
                            //     child: Column(
                            //         children: [
                            //           SectionHeading(
                            //               title: 'Residents',
                            //               showActionButton: false
                            //           ),
                            //           SizedBox(height: CustomSizes.spaceBetweenItems),
                            //           BalangodaCommunity()
                            //         ]
                            //     )
                            // ),

                            SizedBox(height: CustomSizes.spaceBetweenSections)
                          ]
                      )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                    child: Column(
                        children: [

                          const SizedBox(height: CustomSizes.defaultSpace),
                          _buildStaggeredCategoryPanels()


                          // const SizedBox(height: CustomSizes.spaceBetweenSections),
                          // SizedBox(
                          //     width: 200,
                          //     height: 300, // Define an appropriate height for the map
                          //     child: GoogleMap(
                          //         initialCameraPosition: const CameraPosition(
                          //             target: LatLng(6.6666, 80.7049),
                          //             zoom: 14.0
                          //         ),
                          //         markers: _markers
                          //     )
                          // )
                        ]
                    ),

                  )
                ]
            )
        ),
        floatingActionButton: Positioned(
          bottom: 16.0,
          right: 16.0,
            child: FloatingActionButton(
                heroTag: 'uniqueTag2',
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
    );
  }
}

Widget _buildStaggeredCategoryPanels() {
  return StaggeredGrid.count(
    crossAxisCount: 2, // Adjust the number of columns in the grid
    mainAxisSpacing: 15.0,
    crossAxisSpacing: 15.0,
    children: [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.7,
        child: NewsCategoryPanelWidget(
          title: "Announcements",
          subtitle: "Stay Informed with Key Updates",
          icon: Icons.announcement,
          color: Colors.orange,
          onTap: () {
            Get.to(() => const UserAnnouncementsScreen());
            // Navigator.pushNamed(context, Routes.latestNews);
          }
        )
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: NewsCategoryPanelWidget(
          title: "Community Events",
          subtitle: "Join the Fun and Engage",
          icon: Icons.event,
          color: Colors.green,
          onTap: () {
            Get.to(() => const UserCommunityEventsScreen());
          }
        )
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: NewsCategoryPanelWidget(
          title: "Local News",
          subtitle: "The Latest Stories Around You",
          icon: Icons.article,
          color: Colors.blue,
          onTap: () {
            Get.to(() => const UserLocalNewsScreen());
          }
        )
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.7,
        child: NewsCategoryPanelWidget(
          title: "Public Notices",
          subtitle: "Official Communications & Alerts",
          icon: Icons.public,
          color: Colors.brown,
          onTap: () {
            Get.to(() => const UserPublicNoticesScreen());
          }
        )
      ),

      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.7,
        child: NewsCategoryPanelWidget(
          title: "Emergency Alerts",
          subtitle: "Immediate Warnings & Safety Tips",
          icon: Icons.warning,
          color: Colors.red,
          onTap: () {
            Get.to(() => const UserEmergencyAlertsScreen());
          }
        )
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: NewsCategoryPanelWidget(
          title: "Development Projects",
          subtitle: "Building a Better Tomorrow",
          icon: Icons.construction,
          color: Colors.purple,
          onTap: () {
            Get.to(() => const UserDevelopmentProjectsScreen());
          },
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.7,
        child: NewsCategoryPanelWidget(
          title: "Cultural & Lifestyle",
          subtitle: "Discover Local Traditions and Trends",
          icon: Icons.palette,
          color: Colors.teal,
          onTap: () {
            Get.to(() => const UserCulturalAndLifestyleScreen());
          },
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: NewsCategoryPanelWidget(
          title: "Community Spotlights",
          subtitle: "Highlighting Local Heroes and Stories",
          icon: Icons.highlight,
          color: Colors.pink,
          onTap: () {
            Get.to(() => const UserCommunitySpotlightsScreen());
          },
        ),
      )
    ]
  );
}

