import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../responsive/responsive_widget.dart';
import '../../../utils/style.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.Bg,
        body: SingleChildScrollView(
            child: ResponsiveWidget.isSmallScreen(context)
                ? Otpscreen()
                : OtpScreenLarge()));
  }
}

class OtpScreenLarge extends StatelessWidget {
  const OtpScreenLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(
                child: Image.asset(
                  ImageApp.forgetPasswordIg,
                  height: 400,
                  width: 400,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot \nPassword ?',
                        style: GoogleFonts.poppins(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter your E-mail Address for OTP',
                        style: GoogleFonts.poppins(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            hoverColor: Colors.black,
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppIcons.emailIcon)),
                            hintText: ' Enter your Email',
                            hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Pallete.gradient2.withOpacity(0.5),
                                fontSize: 12.0),
                          ),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Color.fromARGB(255, 255, 157, 104)),
                            child: Text(
                              'Send OTP',
                              style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.whiteColor,
                                  fontSize: 13.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Otpscreen extends StatelessWidget {
  const Otpscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              ImageApp.forgetPasswordIg,
              height: 300,
              width: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot \nPassword ?',
                    style: GoogleFonts.poppins(
                        fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your E-mail Address for OTP',
                    style: GoogleFonts.poppins(
                        fontSize: 15.0, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hoverColor: Colors.black,
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.emailIcon)),
                        hintText: ' Enter your Email',
                        hintStyle: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Pallete.gradient2.withOpacity(0.5),
                            fontSize: 12.0),
                      ),
                    )
                  ],
                )),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Color.fromARGB(255, 255, 157, 104)),
                        child: Text(
                          'Send OTP',
                          style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Pallete.whiteColor,
                              fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
