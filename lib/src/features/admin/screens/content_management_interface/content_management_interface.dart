import 'package:flutter/material.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/search_container.dart';
import 'package:balangoda_pulse/src/common/widgets/tabbar/custom_tabbar.dart';
import 'package:balangoda_pulse/src/features/admin/screens/content_management_interface/widgets/content_tab.dart';
import 'package:balangoda_pulse/src/features/core/screens/schedule/components/custom_app_bar.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';

class ContentManagementInterface extends StatelessWidget {
  const ContentManagementInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)
          ),
          title: const Text('Content Management Interface'),
          backgroundColor: CustomColors.primaryColor
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: HelperFunctions.isDarkMode(context)
                    ? CustomColors.black
                    : CustomColors.white,
                pinned: true,
                floating: true,
                expandedHeight: 210,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: const [
                        CustomAppBar(title: 'Content Management Interface'),
                        SearchContainer(text: 'Search for any related')
                      ]
                    )
                  )
                ),
                bottom: const CustomTabBar(
                  tabs: [
                    Tab(child: Text('Announcements')),
                    Tab(child: Text('Community Events')),
                    Tab(child: Text('Public Notices')),
                    Tab(child: Text('Local News')),
                    Tab(child: Text('Development Projects')),
                    Tab(child: Text('Emergency Alerts')),
                    Tab(child: Text('Community Spotlights')),
                    Tab(child: Text('Cultural & Lifestyle')),
                  ]
                )
              )
            ];
          },
          body: const TabBarView(
            children: [
              ContentTab(contentType: 'Announcements'),
              ContentTab(contentType: 'CommunityEvents'),
              ContentTab(contentType: 'PublicNotices'),
              ContentTab(contentType: 'LocalNews'),
              ContentTab(contentType: 'DevelopmentProjects'),
              ContentTab(contentType: 'EmergencyAlerts'),
              ContentTab(contentType: 'CommunitySpotlights'),
              ContentTab(contentType: 'CulturalAndLifestyles'),
            ]
          )
        )
      )
    );
  }
}

