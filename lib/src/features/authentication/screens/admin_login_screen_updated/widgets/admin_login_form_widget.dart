import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/admin/controllers/admin_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminLoginFormWidget extends StatelessWidget {
  const AdminLoginFormWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminLoginController());

    final _formKey = GlobalKey<FormState>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      controller: controller.username,
                      decoration: const InputDecoration(
                          label: Text(username),
                          prefixIcon: Icon(Icons.person_outline_outlined)
                      )
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
                  const SizedBox(height: formHeight - 10),


                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) {
                              await controller.login();
                            }
                          },
                          child: Text(login.toUpperCase())
                      )
                  )
                ]
            )
        )
    );
  }
}