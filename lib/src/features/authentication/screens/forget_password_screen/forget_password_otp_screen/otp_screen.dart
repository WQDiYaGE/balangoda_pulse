import 'package:balangoda_pulse/src/constants/Image_strings.dart';
import 'package:balangoda_pulse/src/constants/sizes.dart';
import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  // final String verificationId;
  // final int? resendToken;

  const OTPScreen({
    super.key,
    // required this.verificationId,
    // this.resendToken
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    String? otp;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage(otpVerificationImage)),
                Text(otpTitle.toUpperCase(), style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 40.0),
                const Text("$otpMessage$phoneNumber$otpMessage2", textAlign: TextAlign.center), // support@balangodapulse.com
                const SizedBox(height: 20.0),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,

                  keyboardType: TextInputType.number,

                  onSubmit: (code) async {
                    otp = code; // store the code when entered
                    // bool isVerified = await controller.verifyOTP(otp!);
                    //
                    // if(isVerified) {
                    //   Get.offAll(() => const NavigationMenu()); // Navigate on success
                    // } else {
                    //   Get.snackbar('Error', 'Invalid OTP. Please try again.'); // Handle invalid OTP
                    // }

                    OTPController.instance.verifyOTP(otp!);
                  }
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        OTPController.instance.verifyOTP(otp!);

                        // if(otp != null) {
                        //   bool isVerified = await controller.verifyOTP(otp!); // Ensure it returns a boolean value
                        //
                        //   if(isVerified) {
                        //     Get.offAll(() => const NavigationMenu()); // Navigate to success
                        //   } else {
                        //     Get.snackbar('Error', 'Invalid OTP. Please try again.'); // Error handling
                        //   }
                        // }
                      },
                      child: const Text(next)
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if(phoneNumber.isNotEmpty) {
                          // Assuming phone number is passed or stored in a secure way
                          controller.resendOTP(phoneNumber);
                        }
                      },
                      child: const Text("Resend OTP")
                  ),
                )
              ]
            )
          ),
        )
      ),
    );
  }
}
