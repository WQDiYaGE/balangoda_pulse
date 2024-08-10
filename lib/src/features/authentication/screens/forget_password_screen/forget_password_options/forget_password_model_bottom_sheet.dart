import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_email_address_screen/forget_password_email_address_screen.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_options/forget_password_btn_widget.dart';
import 'package:balangoda_pulse/src/features/authentication/screens/forget_password_screen/forget_password_phone_number_verification/forget_password_phone_number_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static void buildShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        builder: (context) => Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(forgetPasswordTitle, style: Theme.of(context).textTheme.headlineSmall),
                  Text(forgetPasswordSubTitle, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 30.0),
                  ForgetPasswordBtnWidget(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                                () => const ForgetPasswordEmailAddressScreen()
                        );
                       },
                      title: email,
                      subTitle: resetViaEmailAddress,
                      btnIcon: Icons.mail_outline_rounded
                  ),
                  const SizedBox(height: 30.0),
                  ForgetPasswordBtnWidget(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                                () => const ForgetPasswordPhoneNumberVerificationScreen()
                        );
                      },
                      title: phone,
                      subTitle: resetViaPhoneNumber,
                      btnIcon: Icons.mobile_friendly_rounded
                  )
                ]
            )
        )
    );
  }
}