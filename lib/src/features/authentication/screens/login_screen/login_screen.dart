import 'package:balangoda_pulse/src/common/widgets/form/form_header_widget.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/login_screen/widgets/login_footer_widget.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/login_screen/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define unique GlobalKeys for each form
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: welcomeScreenImage,
                  title: loginTitle,
                  subTitle: loginSubTitle,
                ),
                LoginFormWidget(formKey: _formKey),
                const SizedBox(height: 20),
                const LoginFooterWidget(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 50,
                    width: 220,
                    child: OutlinedButton.icon(
                      onPressed: () => Get.toNamed('/adminLoginScreenUpdated'),
                      icon: const Icon(Icons.person_outline_outlined, color: Colors.black),
                      label: Text(localAuthority.toUpperCase()),
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.green))
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 50,
                    width: 220,
                    child: OutlinedButton.icon(
                      onPressed: () => Get.toNamed('/adminLoginScreenUpdated'),
                      icon: const Icon(Icons.admin_panel_settings_outlined, color: Colors.black),
                      label: Text(administrator.toUpperCase()),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.red))
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
