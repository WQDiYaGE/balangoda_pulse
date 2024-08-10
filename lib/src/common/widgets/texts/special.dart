// import 'package:balangoda_pulse/src/features/core/screens/home/widgets/exclusive_card_ratio.dart';
// import 'package:balangoda_pulse/src/features/core/screens/home/widgets/exclusive_card_widget.dart';
// import 'package:balangoda_pulse/src/features/core/screens/home/widgets/expanded_container.dart';
// import 'package:balangoda_pulse/src/utils/constants/colors.dart';
// import 'package:flutter/material.dart';
// import '../../../../common/widgets/texts/custom_text_widget.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         backgroundColor: CustomColors.white,
//         body: Column(
//             children: [
//               Container(
//                   height: CustomSizes.topContainerHeight,
//                   decoration: BoxDecoration(
//                       color: CustomColors.primaryColor,
//                       borderRadius: const BorderRadius.only(
//                           bottomRight: Radius.circular(CustomSizes.topContainerRadius)
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                             color: CustomColors.darkerGrey.withOpacity(0.3),
//                             offset: const Offset(CustomSizes.featureCardOffsetX, CustomSizes.featureCardOffsetY),
//                             blurRadius: CustomSizes.featureCardBlurRadius,
//                             spreadRadius: CustomSizes.featureCardSpreadRadius
//                         )
//                       ]
//                   ),
//
//                   child: Stack(
//                       children: [
//                         Positioned(
//                             top: CustomSizes.topInsideContainerPositionedTop,
//                             left: CustomSizes.topInsideContainerPositionedLeft,
//                             child: Container(
//                                 height: CustomSizes.topInsideContainerHeight,
//                                 width: CustomSizes.topInsideContainerWidth,
//                                 decoration: const BoxDecoration(
//                                     color: CustomColors.white,
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(CustomSizes.topInsideContainerRadius),
//                                         bottomRight: Radius.circular(CustomSizes.topInsideContainerRadius)
//                                     )
//                                 ),
//                                 child: const Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       CustomTextWidget(
//                                           text: CustomTextStrings.homeScreenHeading,
//                                           size: CustomSizes.homeScreenHeadingFontSize,
//                                           color: CustomColors.textPrimary
//                                       ),
//                                       SizedBox(height: CustomSizes.spaceBetweenHeadingNSubHeading), // Adjust spacing between heading and subheading
//                                       CustomTextWidget(
//                                           text: CustomTextStrings.homeScreenSubHeading,
//                                           size: CustomSizes.homeScreenSubHeadingFontSize,
//                                           color: CustomColors.textSecondary
//                                       )
//                                     ]
//                                 )
//                             )
//                         )
//                       ]
//                   )
//               ),
//               SizedBox(height: height * 0.05),
//
//               const SizedBox(
//                   height: CustomSizes.containerHeight,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                         children: [
//                           ExclusiveCardRatio(
//                               cards: [
//                                 ExclusiveCardWidget(
//                                     customImageUrl: CustomImageStrings.card1,
//                                     heading: CustomTextStrings.outerContainerHeading,
//                                     subHeading: CustomTextStrings.outerContainerSubHeading
//                                 ),
//                                 ExclusiveCardWidget(
//                                     customImageUrl: CustomImageStrings.card2,
//                                     heading: CustomTextStrings.outerContainerHeading2,
//                                     subHeading: CustomTextStrings.outerContainerSubHeading2
//                                 ),
//                                 ExclusiveCardWidget(
//                                     customImageUrl: CustomImageStrings.card3,
//                                     heading: CustomTextStrings.outerContainerHeading3,
//                                     subHeading: CustomTextStrings.outerContainerSubHeading3
//                                 )
//                               ]
//                           )
//                         ]
//                     ),
//                   )
//               ),
//               SizedBox(height: height * 0.01),
//
//               Expanded(
//                   child: MediaQuery.removePadding(
//                     context: context,
//                     removeTop: true,
//                     child: ListView(
//                         children: const [
//                           ExpandedContainer(
//                               heading: 'Recent Updates & News',
//                               subHeading: 'Be Informed: Stay Connected with Community Updates',
//                               applyBottomLeft: true,
//                               applyTopRight: false
//                           ),
//                           ExpandedContainer(
//                               heading: 'Featured Content',
//                               subHeading: 'Do not Miss Out: Explore Our Top Content',
//                               applyBottomLeft: false,
//                               applyTopRight: true
//                           ),
//                           ExpandedContainer(
//                               heading: 'Community Activities',
//                               subHeading: 'Get Involved: Explore Community Events',
//                               applyBottomLeft: true,
//                               applyTopRight: false
//                           ),
//                           ExpandedContainer(
//                               heading: 'Trending Discussions',
//                               subHeading: 'Be Part of the Buzz: Trending Discussions',
//                               applyBottomLeft: false,
//                               applyTopRight: true
//                           ),
//                           ExpandedContainer(
//                               heading: 'Local News & Updates',
//                               subHeading: 'Stay Informed: Local News at Your Fingertips',
//                               applyBottomLeft: true,
//                               applyTopRight: false
//                           ),
//                           ExpandedContainer(
//                               heading: 'Community Spotlight',
//                               subHeading: 'Shine Bright: Celebrating Our Champions',
//                               applyBottomLeft: false,
//                               applyTopRight: true
//                           ),
//                           ExpandedContainer(
//                               heading: 'Personalized Recommendations',
//                               subHeading: 'Tailored for You: Personalized Picks',
//                               applyBottomLeft: true,
//                               applyTopRight: false
//                           )
//                         ]
//                     ),
//                   )
//               )
//             ]
//         )
//     );
//   }
// }
//
//
// // body: SingleChildScrollView(
// //     child: Column(
// //       children: [
// //         // PrimaryHeaderContainer(
// //         //     child: Column(
// //         //       children: [
// //         //         HomeAppbar(),
// //         //         SizedBox(height: CustomSizes.spaceBetweenSections),
// //         //
// //         //         SearchContainer(text: 'Search Anything'),
// //         //         SizedBox(height: CustomSizes.spaceBetweenSections),
// //         //
// //         //         Padding(
// //         //           padding: EdgeInsets.only(left: CustomSizes.defaultSpace),
// //         //           child: Column(
// //         //             children: [
// //         //               SectionHeading(
// //         //                   title: 'Residents',
// //         //                   showActionButton: false
// //         //               ),
// //         //               SizedBox(height: CustomSizes.spaceBetweenItems),
// //         //               BalangodaCommunity()
// //         //             ]
// //         //           )
// //         //         )
// //         //       ]
// //         //     )
// //         // ),
// //
// //         // Padding(
// //         //   padding: EdgeInsets.all(CustomSizes.defaultSpace),
// //         //   child: Column(
// //         //     children: [
// //         //       PromoSlider(
// //         //         banners: [
// //         //           CustomImageStrings.banner1,
// //         //           CustomImageStrings.banner2,
// //         //           CustomImageStrings.banner3
// //         //         ]
// //         //       )
// //         //     ]
// //         //   ),
// //         //
// //         // )
// //       ]
// //     )
// // )