import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/colors.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/models/on_boarding_model.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/on_boarding_screen/on_boarding_page.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingController extends GetxController {

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPage(
        model: OnBoardingModel(
            image: onBoardingImage1,
            title: onBoardingTitle1,
            subTitle: onBoardingSubTitle1,
            counterText: onBoardingCounter1,
            bgColor: onBoardingPage1Color
        )
    ),
    OnBoardingPage(
        model: OnBoardingModel(
            image: onBoardingImage2,
            title: onBoardingTitle2,
            subTitle: onBoardingSubTitle2,
            counterText: onBoardingCounter2,
            bgColor: onBoardingPage2Color
        )
    ),
    OnBoardingPage(
        model: OnBoardingModel(
            image: onBoardingImage3,
            title: onBoardingTitle3,
            subTitle: onBoardingSubTitle3,
            counterText: onBoardingCounter3,
            bgColor: onBoardingPage3Color
        )
    )
  ];


  // skip() => controller.jumpToPage(page: 2);
  skip() {
    int nextPage = controller.currentPage + 1;
    if(nextPage >= pages.length)  {
      Get.off(const WelcomeScreen());
    } else {
      controller.animateToPage(page: nextPage);
    }
  }
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;
}