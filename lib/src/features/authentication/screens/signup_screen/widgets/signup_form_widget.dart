      import 'package:balangoda_pulse/src/constants/sizes.dart';
      import 'package:balangoda_pulse/src/constants/text_strings.dart';
      import 'package:balangoda_pulse/src/features/authentication/controllers/signup_controller.dart';
    import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_otp_screen/otp_screen.dart';
      import 'package:flutter/material.dart';
      import 'package:get/get.dart';

    import '../../../models/user_model.dart';

      class SignUpFormWidget extends StatelessWidget {
        const SignUpFormWidget({
          super.key
        });

        @override
        Widget build(BuildContext context) {
          final controller = Get.put(SignUpController());

          final _formKey = GlobalKey<FormState>();
          return Container(
              padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
              child: Form(
                key: _formKey,
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
                            if (value!.isEmpty || !RegExp(r'^\+\d{1,3}\d{4,}$').hasMatch(value)) {
                              return('Please enter a valid phone number.');
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: formHeight - 20),
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
                                  )
                              )
                      ),
                      const SizedBox(height: formHeight - 20),

                      TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            label: Text(email),
                            prefixIcon: Icon(Icons.email_outlined),
                          )
                      ),
                      const SizedBox(height: formHeight - 20),

                      TextFormField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                            label: Text(username),
                            prefixIcon: Icon(Icons.person_outline_outlined)
                          )
                      ),
                      const SizedBox(height: formHeight - 10),


                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if(_formKey.currentState!.validate()) {
                                try {
                                  final user = UserModel(
                                    phoneNumber: controller.phoneNumber.text.trim(),
                                    password: controller.password.text.trim(),
                                    username: controller.username.text.trim(),
                                    email: controller.email.text.trim(),
                                  );
                                  await SignUpController.instance.createUser(user);

                                  // SignUpController.instance.phoneAuthentication(
                                  //     controller.phoneNumber.text.trim()
                                  // );
                                  // Get.to(() => const OTPScreen());
                                } catch(e) {
                                  Get.snackbar("Sign-Up Error", "Failed to create user. Error: ${e.toString()}");
                                }
                              }
                            },
                            child: Text(signup.toUpperCase())
                        )
                      )
                    ]
                )
              )
          );
        }
      }