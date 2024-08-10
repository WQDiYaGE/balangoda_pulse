import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../user_management/user_controller.dart';

class LoginFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginFormWidget({
    super.key, required this.formKey
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: controller.phoneNumber,
                    decoration: const InputDecoration(
                        label: Text(phoneNumber),
                        prefixIcon: Icon(Icons.phone_iphone_outlined)
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return('Please enter a phone number.');
                      }
                      if(value.isNotEmpty && !RegExp(r'^\+\d{1,3}\d{4,}$').hasMatch(value)) {
                        return('Please enter a valid phone number.');
                      }
                      return null;
                    }
                ),
                const SizedBox(height: formHeight - 20),
                // Row(
                //   children: [
                //     Checkbox(
                //         value: controller.rememberMe.value,
                //         onChanged: (value) {
                //           controller.rememberMe.value = !controller.rememberMe.value;
                //         }
                //     ),
                //     const Text(rememberMe)
                //   ]
                // ),
                // Align(
                //     alignment: Alignment.centerRight,
                //     child: TextButton(
                //         onPressed: () {
                //           ForgetPasswordScreen.buildShowModalBottomSheet(context);
                //         },
                //         child: const Text(forgetPassword)
                //     )
                // ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if(controller.loginFormKey.currentState!.validate()) {
                            LoginController.instance.checkPhoneNumber(controller.phoneNumber.text.trim());
                          }
                        },
                        child: Text(confirm.toUpperCase())
                    )
                ),
                const SizedBox(height: formHeight - 20),
                Obx(
                      () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed:
                          controller.isPhoneNumberVerified.value
                              ? () {
                            LoginController.instance.verifyPhoneNumber(controller.phoneNumber.text.trim());
                          }
                              : null,
                          child: Text(verify.toUpperCase())
                      )
                  ),
                )
              ]
          ),
        )
    );

  }


}
