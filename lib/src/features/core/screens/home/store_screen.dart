import 'package:balangoda_pulse/src/common/layout/custom_grid_layout.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/shapes/containers/search_container.dart';
import 'package:balangoda_pulse/src/common/widgets/feature/category_tab.dart';
import 'package:balangoda_pulse/src/common/widgets/texts/section_heading.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/feature/feature_showcase.dart';
import '../../../../common/widgets/tabbar/custom_tabbar.dart';
import '../../../../common/widgets/ucb/urban_council_balangoda_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            // -- Urban Council Balangoda
            UrbanCouncilBalangodaIcon(onPressed: () {})
          ]
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: HelperFunctions.isDarkMode(context) ? CustomColors.black : CustomColors.white,
                  pinned: true,
                  floating: true,
                  expandedHeight: 520,

                  flexibleSpace: Padding(
                      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: CustomSizes.spaceBetweenItems),


                          const SearchContainer(text: 'Search in Store', showBackground: false, padding: EdgeInsets.zero),
                          const SizedBox(height: CustomSizes.spaceBetweenSections),

                          // -- Featured Brands
                          const SectionHeading(title: 'Featured Brands'),
                          const SizedBox(height: CustomSizes.spaceBetweenItems / 1.5),

                          CustomGridLayout(
                              mainAxisExtent: 138.0,
                              itemBuilder: (_, index) => GestureDetector(
                                onTap: () {},
                                child: const FeatureShowcase(images: [])
                              ),
                              itemCount: 4
                          )
                        ]
                      )
                  ),
                  bottom: const CustomTabBar(tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furnitures')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics'))
                    ])
                )
              ];
            },

            body: const TabBarView(
                children: [
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab()
                ]
            )
        )

    //       SingleChildScrollView(
    //   child: Column(
    //   children: [
    //   // Search Bar
    //   Padding(
    //       padding: const EdgeInsets.all(16.0),
    //   child: TextField(
    //     decoration: InputDecoration(
    //       hintText: 'Search for services',
    //       prefixIcon: const Icon(Icons.search),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(8.0),
    //       ),
    //     ),
    //   ),
    // ),
    //
    // // Featured Services Section
    // const SectionHeading(title: 'Featured Services'),
    // const SizedBox(height: 16.0),
    // SizedBox(
    // height: 200.0, // Adjust height as needed
    // child: ListView.builder(
    // scrollDirection: Axis.horizontal,
    // itemCount: featuredServices.length,
    // itemBuilder: (context, index) {
    // final service = featuredServices[index];
    // return Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: ServiceCard(service: service),
    // );
    // },
    // ),
    // ),
    //
    // // Categories Section
    // const SectionHeading(title: 'Categories'),
    // const SizedBox(height: 16.0),
    // SizedBox(
    // height: 100.0, // Adjust height as needed
    // child: ListView.builder(
    // scrollDirection: Axis.horizontal,
    // itemCount: categories.length,
    // itemBuilder: (context, index) {
    // final category = categories[index];
    // return Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: CategoryCard(category: category),
    // );
    // },
    // ),
    // ),
    //
    // // Service Listings
    // const SectionHeading(title: 'Service Listings'),
    // const SizedBox(height: 16.0),
    // ListView.builder(
    // shrinkWrap: true,
    // physics: const NeverScrollableScrollPhysics(),
    // itemCount: localServices.length,
    // itemBuilder: (context, index) {
    // final service = localServices[index];
    // return Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: ServiceCard(service: service),
    // );
    // },
    // ),
    // ],
    // ),
    // )
      ),
    );
  }
}






