import 'package:balangoda_pulse/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future animateIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.to(const OnBoardingScreen());
    // WelcomeScreen()
  }

  Future animateOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}