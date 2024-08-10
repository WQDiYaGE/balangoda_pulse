import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:balangoda_pulse/src/common/widgets/custom/cards/custom_card_vertical.dart';
import 'package:balangoda_pulse/src/features/core/screens/home/widgets/home_app_bar.dart';
import 'package:balangoda_pulse/src/features/core/screens/home/widgets/promo_slider.dart';
import 'package:balangoda_pulse/src/utils/constants/colors.dart';

import '../../../../common/layout/custom_grid_layout.dart';
import '../../../../common/widgets/custom/shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom/shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<Marker> _markers = {};
  late GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        const Marker(
            markerId: MarkerId('balangoda_center'),
            position: LatLng(6.6666, 80.7049), // Coordinates of Balangoda center
            infoWindow: InfoWindow(
              title: 'Balangoda Urban Council',
              snippet: 'Center of local governance'
            )
        )
      );
    });
  }


  @override
  Widget build(BuildContext context) {

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
                          const PromoSlider(
                              banners: [
                                CustomImageStrings.banner1,
                                CustomImageStrings.banner2,
                                CustomImageStrings.banner3
                              ]
                          ),
                          const SizedBox(height: CustomSizes.spaceBetweenSections),

                          // -- News Feed
                          const SectionHeading(title: 'News Feed'),
                          const SizedBox(height: CustomSizes.spaceBetweenItems),
                          CustomGridLayout(
                              itemBuilder: (_, index) => const CustomCardVertical(),
                              itemCount: 10
                          ),
                          const SizedBox(height: CustomSizes.spaceBetweenSections),

                          SizedBox(
                            width: 200,
                            height: 300, // Define an appropriate height for the map
                            child: GoogleMap(
                                initialCameraPosition: const CameraPosition(
                                  target: LatLng(6.6666, 80.7049),
                                  zoom: 14.0
                                ),
                                markers: _markers
                            )
                          )
                        ]
                    ),

                  )
                ]
            )
        )
    );
  }
}






