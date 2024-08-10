import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // const Text("OR"),
          // const SizedBox(height: formHeight - 25),
          // SizedBox(
          //   width: double.infinity,
          //   child: OutlinedButton.icon(
          //       onPressed: () async {
          //         try {
          //           await AuthenticationRepository.instance.signInWithGoogle();
          //           Get.offAll(() => const Dashboard());
          //         } catch(e) {
          //           Get.snackbar('Sign-in Error', 'Failed to sign in with Google');
          //         }
          //       },
          //       icon: const Image(
          //           image: AssetImage(googleLogo),
          //           width: 20.0
          //       ),
          //       label: const Text(signInWithGoogle)
          //   )
          // ),
          // const SizedBox(height: formHeight - 25),
          TextButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              child: Text.rich(
                  TextSpan(
                      text: alreadyHaveAnAccount,
                      style: Theme.of(context).textTheme.labelLarge,
                      children: const [
                        TextSpan(
                            text: login,
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