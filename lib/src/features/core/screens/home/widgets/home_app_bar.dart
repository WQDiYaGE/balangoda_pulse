import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/ucb/urban_council_balangoda_icon.dart';
import '../../../../../constants/text_strings.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey)),
              Text(homeAppbarSubTitle, style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black))
            ]
        ),
        actions: [
          UrbanCouncilBalangodaIcon(onPressed: () {}, iconColor: Colors.white)
        ]
    );
  }
}