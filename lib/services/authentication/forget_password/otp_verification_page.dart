import 'dart:async';

import 'package:dharmalib/responsive/responsive_widget.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/style.dart';

class PinCodeVerification extends StatefulWidget {
  final String identityType;

  const PinCodeVerification({super.key, required this.identityType});

  @override
  State<PinCodeVerification> createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = '';
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    textEditingController = TextEditingController();
    super.initState();
  }

  void dispose() {
    textEditingController.dispose();
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.Bg,
      body: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Lottie.asset(Animations.otpAnimation,
                    repeat: true, fit: BoxFit.contain),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code Verification',
                      style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Enter the code sent to ",
                            children: [
                              TextSpan(
                                text: widget.identityType,
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 500,
                child: Form(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                        appContext: context,
                        pinTheme: PinTheme(
                            activeColor: Colors.black,
                            selectedColor: Colors.black),
                        cursorColor: Pallete.gradient1,
                        length: 6,
                        animationType: AnimationType.fade,
                        animationDuration: Duration(milliseconds: 300),
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          print('Completed');
                        },
                        beforeTextPaste: (text) {
                          print('Aloow $text');
                          return true;
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            //currentText = value;
                          });
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                    hasError ? "*Please fill up all the cells properly" : ""),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                    text: TextSpan(
                        text: "Didn't receive the code? ",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        children: [
                      TextSpan(
                          text: "RESEND",
                          recognizer: onTapRecognizer,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Pallete.gradient1))
                    ])),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                child: ButtonTheme(
                    height: 50,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          formKey.currentState!.validate();
                          if (currentText.length != 6 ||
                              currentText != 'towtow') {
                            errorController.add(ErrorAnimationType.shake);
                            setState(() {
                              hasError = true;
                            });
                          } else {
                            setState(() {
                              hasError = false;
                              scaffoldkey.currentState!.showBottomSheet(
                                (context) => Text("Some thing is wrong!"),
                              );
                            });
                          }
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Pallete.gradient1),
                          child: Center(
                            child: Text(
                              'Verify',
                              style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.whiteColor,
                                  fontSize: 13.0),
                            ),
                          ),
                        ),
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
