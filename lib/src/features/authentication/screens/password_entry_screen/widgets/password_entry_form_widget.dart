import 'package:balangoda_pulse/src/features/authentication/controllers/password_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../forget_password_screen/forget_password_options/forget_password_model_bottom_sheet.dart';

class PasswordEntryFormWidget extends StatelessWidget {
  const PasswordEntryFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordEntryController());


    return Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                        () => TextFormField(
                        controller: controller.password,
                        obscureText: controller.isHidden.value,
                        decoration: InputDecoration(
                            label: const Text(password),
                            prefixIcon: const Icon(Icons.fingerprint_outlined),
                            suffixIcon: IconButton(
                                onPressed: () => controller.isHidden.toggle(),
                                icon: Icon(controller.isHidden.value ? Icons.visibility_outlined : Icons.visibility_off_outlined)
                            )
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter the password.';
                          }
                          return null;
                        }
                    )
                ),
                // const SizedBox(height: formHeight - 20),
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
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          ForgetPasswordScreen.buildShowModalBottomSheet(context);
                        },
                        child: const Text(forgetPassword)
                    )
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if(controller.loginFormKey.currentState!.validate()) {
                            controller.loginUserWithPassword();
                          }

                        },
                        child: Text(login.toUpperCase())
                    )
                )
              ]
          ),
        )
    );
  }
}
