import 'package:dharmalib/responsive/responsive_widget.dart';
import 'package:dharmalib/services/authentication/forget_password/forget_password_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style.dart';
import 'forget_option_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> ShowModelBottom(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            builder: (context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make Selection',
                    style: GoogleFonts.poppins(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Select one of the options given below to reset your password',
                    style: ralewayStyle.copyWith(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  OptionVer(
                    btnIcon: Icons.mail_outline_rounded,
                    title: 'E-mail',
                    subtitle: 'Reset via Mail Verification',
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ForgetPasswordMailScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    child: OptionVer(
                      btnIcon: Icons.mobile_friendly_rounded,
                      title: 'Phone Number',
                      subtitle: 'Reset via Phone Number Verification',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        : showDialog(
            context: context,
            builder: (context) => Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              child: AlertDialog(
                content: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Make Selection',
                        style: GoogleFonts.poppins(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Select one of the options given below to reset your password',
                        style: ralewayStyle.copyWith(),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      OptionVer(
                        btnIcon: Icons.mail_outline_rounded,
                        title: 'E-mail',
                        subtitle: 'Reset via Mail Verification',
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => ForgetPasswordMailScreen());
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      OptionVer(
                        btnIcon: Icons.mobile_friendly_rounded,
                        title: 'Phone Number',
                        subtitle: 'Reset via Phone Number Verification',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
