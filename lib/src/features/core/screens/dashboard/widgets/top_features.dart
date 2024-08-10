import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/features/core/models/dashboard/top_features_model.dart';
import 'package:flutter/material.dart';

class TopFeatures extends StatelessWidget {
  const TopFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = DashboardTopFeatures.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
            child: SizedBox(
                width: 320,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cardBgColor
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text(
                                          list[index].title,
                                          style: Theme.of(context).textTheme.bodyLarge,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis
                                      )
                                  ),
                                  const Flexible(
                                      child: Image(
                                          image: AssetImage(topFeature1),
                                          height: 110
                                      )
                                  )
                                ]
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Icon(
                                            Icons.play_arrow
                                        )
                                    ),
                                    const SizedBox(width: dashboardCardPadding),
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              list[index].heading,
                                              style: Theme.of(context).textTheme.bodySmall,
                                              overflow: TextOverflow.ellipsis
                                          ),
                                          Text(
                                              list[index].subHeading,
                                              style: Theme.of(context).textTheme.bodySmall,
                                              overflow: TextOverflow.ellipsis
                                          )
                                        ]
                                    )
                                  ]
                              ),
                            )
                          ]
                      )
                  ),
                )
            ),
          )
      ),
    );
  }
}