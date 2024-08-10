import 'package:balangoda_pulse/src/common/widgets/form/form_header_widget.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/admin_login_screen_updated/widgets/admin_login_form_widget.dart';
import 'package:balangoda_pulse/src/utils/constants/image_strings.dart';
import 'package:balangoda_pulse/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class AdminLoginScreenUpdated extends StatelessWidget {
  const AdminLoginScreenUpdated({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(defaultSize),
                  child: const Column(
                      children: [
                        FormHeaderWidget(
                            image: CustomImageStrings.welcomeScreenImageUpdated,
                            title: CustomTextStrings.adminLoginTitle,
                            subTitle: CustomTextStrings.adminLoginSubTitle
                        ),
                        AdminLoginFormWidget()
                      ]

                  )
              )
          )
      ),
    );
  }
}






