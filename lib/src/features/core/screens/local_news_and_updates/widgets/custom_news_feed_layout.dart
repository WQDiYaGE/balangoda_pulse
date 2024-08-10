// import 'package:balangoda_pulse/src/common/styles/shadow_styles.dart';
// import 'package:balangoda_pulse/src/features/core/screens/local_news_and_updates/widgets/article_detail_page.dart';
// import 'package:balangoda_pulse/src/utils/constants/colors.dart';
// import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
// import 'package:balangoda_pulse/src/utils/helper/helper_functions.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../common/widgets/custom/shapes/containers/custom_rounded_container.dart';
//
// class CustomNewsFeedLayout extends StatelessWidget {
//   const CustomNewsFeedLayout({
//     super.key,
//     required this.title,
//     required this.summary,
//     required this.author,
//     required this.date,
//     required this.imageUrl,
//     required this.readMoreUrl,
//   });
//
//   final String title;
//   final String summary;
//   final String author;
//   final String date;
//   final String imageUrl;
//   final String readMoreUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = HelperFunctions.isDarkMode(context);
//
//     return GestureDetector(
//       onTap: () {
//         // Handle read more action
//       },
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(CustomSizes.paddingSpecial),
//         decoration: BoxDecoration(
//           color: dark ? CustomColors.darkerGrey : CustomColors.white,
//           borderRadius: BorderRadius.circular(CustomSizes.featureRadius),
//           boxShadow: [ShadowStyles.verticalFeatureShadowStyle],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomRoundedContainer(
//               height: 50,
//               backgroundColor: dark ? CustomColors.darkColor : CustomColors.lightColor,
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(Icons.error);
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if(loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
//                           : null
//                     )
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: CustomSizes.featureSpace),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleLarge
//             ),
//             const SizedBox(height: CustomSizes.small),
//             Text(
//               summary,
//               style: Theme.of(context).textTheme.bodyMedium,
//               maxLines: 5,
//               overflow: TextOverflow.ellipsis
//             ),
//             const SizedBox(height: CustomSizes.small),
//             Text(
//               author,
//               style: Theme.of(context).textTheme.bodyLarge
//             ),
//             const SizedBox(height: CustomSizes.small),
//             Text(
//               date,
//               style: Theme.of(context).textTheme.bodyMedium
//             ),
//             const SizedBox(height: CustomSizes.small),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: TextButton(
//                 onPressed: () {
//                   // Navigate to full article
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ArticleDetailPage(url: readMoreUrl)
//                       )
//                   );
//                 },
//                 child: const Text('Read More'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
