import 'package:balangoda_pulse/src/common/layout/custom_grid_layout.dart';
import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:balangoda_pulse/src/common/widgets/custom/cards/custom_card_vertical.dart';
import 'package:balangoda_pulse/src/common/widgets/icons/circular_icon.dart';
import 'package:balangoda_pulse/src/features/core/screens/home/home_screen.dart';
import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CircularIcon(icon: Iconsax.add, onPressed: () => const HomeScreen())
          ]
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: CustomGridLayout(
                itemBuilder: (_, index) => const CustomCardVertical(),
                itemCount: 5
            )
        )
      )
    );
  }
}
