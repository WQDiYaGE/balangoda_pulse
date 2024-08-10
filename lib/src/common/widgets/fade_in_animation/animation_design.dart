import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:balangoda_pulse/src/common/widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animatePosition
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final AnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => AnimatedPositioned(
                top: controller.animate.value?animatePosition!.topBefore:animatePosition!.topAfter,
                left: controller.animate.value?animatePosition!.leftAfter:animatePosition!.leftBefore,
                bottom: controller.animate.value?animatePosition!.bottomAfter:animatePosition!.bottomBefore,
                right: controller.animate.value?animatePosition!.rightAfter:animatePosition!.rightBefore,
                duration: Duration(milliseconds: durationInMs),
                child: AnimatedOpacity(
                    opacity: controller.animate.value?1:0,
                    duration: Duration(milliseconds: durationInMs),
                    child: child
                )
            )
    );
  }
}
