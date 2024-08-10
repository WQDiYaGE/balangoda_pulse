import 'package:balangoda_pulse/src/common/widgets/form/form_header_widget.dart';
import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/controllers/forget_password_phone_number_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNumberVerificationScreen extends StatelessWidget {
  const ForgetPasswordPhoneNumberVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordPhoneNumberVerificationController());

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
                                        controller: controller.phoneNumber,
                                        decoration: const InputDecoration(
                                          labelText: phoneNumber,
                                          prefixIcon: Icon(Icons.phone_iphone_outlined),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if(value!.isEmpty) {
                                            return 'Please enter a phone number';
                                          }
                                          return null;
                                        },
                                    ),
                                    const SizedBox(height: 20.0),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            // if(formKey.currentState!.validate()) {
                                            //   ForgetPasswordPhoneNumberVerificationController.instance.phoneAuthentication(
                                            //       controller.phoneNumber.text.trim()
                                            //   );
                                            //
                                            //
                                            // }
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
