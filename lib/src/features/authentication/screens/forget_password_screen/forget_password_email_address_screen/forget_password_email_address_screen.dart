import 'package:balangoda_pulse/src/common/widgets/form/form_header_widget.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ForgetPasswordEmailAddressScreen extends StatelessWidget {
  const ForgetPasswordEmailAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const SizedBox(height: defaultSize * 4),
                const FormHeaderWidget(
                  image: forgetPasswordImage,
                  title: forgetPasswordEmailAddressTitle,
                  subTitle: forgetPasswordEmailAddressSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: formHeight),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: email,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        )
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                // EmailVerificationController.instance.
                              }
                            },
                            child: const Text(next)
                        ),
                      )
                    ]
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}
