import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_showcase.dart';
import 'package:balangoda_pulse/src/features/core/screens/local_services_directory/widgets/service_tab.dart';
import 'package:flutter/material.dart';

import '../../../../common/layout/custom_page_layout.dart';
import '../../../../common/widgets/custom/shapes/containers/search_container.dart';
import '../../../../common/widgets/tabbar/custom_tabbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';


class LocalServicesScreen extends StatelessWidget {
  const LocalServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: HelperFunctions.isDarkMode(context) ? CustomColors.black : CustomColors.white,
                    pinned: true,
                    floating: true,
                    expandedHeight: 190,

                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              const SizedBox(height: CustomSizes.spaceRemovingCustomAppBar),


                              const SearchContainer(text: 'Search for Services', showBackground: false, padding: EdgeInsets.zero),
                              const SizedBox(height: CustomSizes.spaceBetweenSections),

                              // -- Featured Services
                              // const SectionHeading(title: 'Featured Services'),
                              // const SizedBox(height: CustomSizes.spaceBetweenItems / 1.5),

                              // SizedBox(
                              //   height: 295.0,
                              //   child: CustomPageLayout(
                              //       // mainAxisExtent: 280.0,
                              //       itemBuilder: (_, index) => GestureDetector(
                              //           onTap: () {},
                              //           child: const ServiceShowcase(images: [])
                              //       ),
                              //       itemCount: 5
                              //   ),
                              // )
                            ]
                        )
                    ),
                    bottom: const CustomTabBar(tabs: [
                      Tab(child: Text('Revenue Division')),
                      Tab(child: Text('Solid Waste Management Centre')),
                      Tab(child: Text('Health Sector')),
                      Tab(child: Text('Preschool')),
                      Tab(child: Text('Industry Sector')),
                      Tab(child: Text('Public Library')),
                      Tab(child: Text('E-Library')),
                      Tab(child: Text('Free Ayurveda')),
                      Tab(child: Text('Sampath Square')),
                      Tab(child: Text('Training Unit'))
                    ])
                )
              ];
            },

            body: const TabBarView(
                children: [
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab(),
                  ServiceTab()
                ]
            )
        )

      ),
    );
  }
}
