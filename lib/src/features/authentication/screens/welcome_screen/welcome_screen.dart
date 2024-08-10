import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/animation_design.dart';
import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animateOut();


    var mediaQuery = MediaQuery.of(context);

    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode?secondaryColor:primaryColor,
        body: Stack(
            children: [
              FadeInAnimation(
                  durationInMs: 1200,
                  animatePosition: AnimatePosition(
                      bottomAfter: 0,
                      bottomBefore: -100,
                      leftBefore: 0,
                      leftAfter: 0,
                      topAfter: 0,
                      topBefore: 0,
                      rightAfter: 0,
                      rightBefore: 0
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(defaultSize),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: const AssetImage(welcomeScreenImage),
                              height: height * 0.6,
                            ),
                            Column(
                              children: [
                                Text(
                                    welcomeTitle,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                    textAlign: TextAlign.center
                                ),
                                Text(
                                    welcomeSubTitle,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                            Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () => Get.to(() => const LoginScreen()),
                                        child: Text(login.toUpperCase())
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                      child: ElevatedButton(
                                        onPressed: () => Get.to(() => const SignUpScreen()),
                                        child: Text(signup.toUpperCase()),
                                      )
                                  )
                                ]
                            )
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}
