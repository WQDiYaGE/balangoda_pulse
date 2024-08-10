import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner 01
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardBgColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Image(
                            image: AssetImage(bookmarkIcon)
                        )
                    ),
                    Flexible(
                        child: Image(
                            image: AssetImage(banner1)
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  dashboardBannerTitle1,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dashboardBannerSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: dashboardCardPadding),

        // Banner 02
        Expanded(
            child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardBgColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Image(
                                    image: AssetImage(bookmarkIcon)
                                )
                            ),
                            Flexible(
                                child: Image(
                                    image: AssetImage(banner2)
                                )
                            ),
                          ],
                        ),
                        Text(
                          dashboardBannerTitle1,
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                            dashboardBannerSubTitle,
                            style: Theme.of(context).textTheme.labelMedium,
                            overflow: TextOverflow.ellipsis
                        )
                      ],
                    ),
                  ),

                  // Button
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: (){}, child: const Text(dashboardButton))
                  )
                ]
            )
        )
      ],
    );
  }
}