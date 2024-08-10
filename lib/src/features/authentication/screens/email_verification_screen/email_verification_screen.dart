import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/controllers/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
              top: defaultSize * 5,
              left: defaultSize,
              right: defaultSize,
              bottom: defaultSize * 2
            ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LineAwesomeIcons.envelope_open, size: 100),
              const SizedBox(height: defaultSize * 2),
              Text(emailVerificationTitle.tr, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: defaultSize * 2),
              Text(
                emailVerificationSubTitle.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: defaultSize * 2),
              Text(
                  emailVerificationSubTitle2.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: defaultSize * 2),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () => controller.manuallyCheckEmailVerificationStatus(),
                  child: Text(continueButton.tr)
                )
              ),
              const SizedBox(height: defaultSize * 2),
              TextButton(
                  onPressed: () => controller.resendVerificationEmail(),
                  child: Text(resendEmailLink.tr)
              ),
              TextButton(
                  onPressed: (){
                    // AuthenticationRepository.instance.logout();
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(width: 5),
                      Text(backToLogin.tr.toLowerCase())
                    ]
                  )
              )
            ]
          ),
        ),
      )
    );
  }
}
