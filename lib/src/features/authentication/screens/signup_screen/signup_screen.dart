import 'package:balangoda_pulse/src/common/widgets/form/form_header_widget.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/signup_screen/widgets/signup_footer_widget.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/signup_screen/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(defaultSize),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormHeaderWidget(
                            image: welcomeScreenImage,
                            title: signupTitle,
                            subTitle: signupSubTitle
                        ),
      
                        SignUpFormWidget(),
                        SignUpFooterWidget()
                      ]
      
                  )
              )
          )
      ),
    );
  }
}






