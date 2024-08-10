import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/features/core/models/dashboard/features_model.dart';
import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = DashboardFeatures.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(
                children: [
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkColor),
                      child: Center(
                          child: Text(list[index].title, style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.white))
                      )
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(list[index].heading, style: Theme.of(context).textTheme.labelLarge, overflow: TextOverflow.ellipsis),
                            Text(list[index].subHeading, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)
                          ]
                      )
                  )
                ]
            )
          ),
        )
      )
    );
  }
}