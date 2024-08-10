import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/animation_design.dart';
import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animateIn();

    // Future.delayed(const Duration(milliseconds: 2500), () {
    //   Get.offAll(() => const AuthenticationWrapper());
    // });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeInAnimation(
                durationInMs: 1600,
                animatePosition: AnimatePosition(
                  // topAfter: 10,
                  // topBefore: -30,
                  leftAfter: 20,
                  leftBefore: -30
                ),
                child: const Image(
                    image: AssetImage(splashTopIcon)
                )
            ),
            FadeInAnimation(
                durationInMs: 2000,
                animatePosition: AnimatePosition(
                    topAfter: 100,
                    topBefore: 100,
                    leftAfter: defaultSize,
                    leftBefore: -80
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      appName,
                      style: Theme.of(context).textTheme.headlineSmall
                  ),
                      Text(
                      appTagLine,
                      style: Theme.of(context).textTheme.labelLarge
                  )
                    ]
                )
            ),
            FadeInAnimation(
                durationInMs: 2400,
                animatePosition: AnimatePosition(
                  bottomAfter: 100,
                  bottomBefore: 0
                ),
                child: const Image(
                    width: 410,
                    height: 510,
                    image: AssetImage(splashImage)
                )
            ),
            FadeInAnimation(
                durationInMs: 2400,
                animatePosition: AnimatePosition(
                  bottomAfter: 60,
                  bottomBefore: 0,
                  rightAfter: defaultSize,
                  rightBefore: defaultSize
                ),
                child: Container(
                    width: splashContainerSize,
                    height: splashContainerSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor
                    )
                )
            )
          ]
        ),
      )
    );
  }
  

}

