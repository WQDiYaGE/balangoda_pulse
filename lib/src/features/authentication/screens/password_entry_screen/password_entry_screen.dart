import 'package:balangoda_pulse/src/features/authentication/screens/password_entry_screen/widgets/password_entry_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/form/form_header_widget.dart';
import '../../../../constants/Image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class PasswordEntryScreen extends StatelessWidget {
  const PasswordEntryScreen({super.key});

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
                            image: welcomeScreenImage,
                            title: passwordEntryTitle,
                            subTitle: passwordEntrySubTitle
                        ),

                        PasswordEntryFormWidget()
                      ]

                  )
              )
          )
      ),
    );
  }
}
