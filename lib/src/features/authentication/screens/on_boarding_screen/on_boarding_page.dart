import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/features/authentication/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(defaultSize),
        color: model.bgColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage(model.image), height: size.height * 0.45),
              Column(
                  children: [
                    Text(model.title, style: Theme.of(context).textTheme.headlineSmall),
                    Text(model.subTitle, textAlign: TextAlign.center)
                  ]
              ),
              Text(model.counterText, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 100.0)
            ]
        )
    );
  }
}