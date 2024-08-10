import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),

          ),
          Positioned(
            bottom: 60.0,
              child: OutlinedButton(
                  onPressed: () => obController.animateToNextSlide(),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20)
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: darkColor,
                      shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.arrow_forward_ios)
                  )
              )
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => Get.to(const WelcomeScreen()),
                  child: const Text("Skip", style: TextStyle(color: Colors.grey))
              )
          ),
          Obx(
            () => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                    activeIndex: obController.currentPage.value,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Color(0xff272727),
                      dotHeight: 5.0
                    )
                )
            ),
          )
        ]
      )
    );
  }


}


