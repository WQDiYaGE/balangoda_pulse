import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:balangoda_pulse/src/features/core/screens/navigation_menu.dart';
import 'package:balangoda_pulse/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Text("OR"),
          const SizedBox(height: formHeight - 25),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
                onPressed: () async {
                  try {
                    await AuthenticationRepository.instance.signInWithGoogle();
                    Get.offAll(() => const NavigationMenu());
                  } catch(e) {
                    Get.snackbar('Sign-in Error', e.toString());
                  }
                },
                icon: const Image(
                    image: AssetImage(googleLogo),
                    width: 20.0
                ),
                label: const Text(signInWithGoogle)
            ),
          ),
          const SizedBox(height: formHeight - 25),
          TextButton(
              onPressed: () => Get.to(() => const SignUpScreen()),
              child: Text.rich(
                  TextSpan(
                      text: doNotHaveAnAccount,
                      style: Theme.of(context).textTheme.labelLarge,
                      children: const [
                        TextSpan(
                            text: signup,
                            style: TextStyle(color: Colors.blue)
                        )
                      ]
                  )
              )
          )


        ]

    );
  }
}