// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dharmalib/responsive/responsive_widget.dart';
import 'package:dharmalib/screens/Login%20Page/sign_up.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:dharmalib/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/authentication/controllers/sign_in_controller.dart';
import '../../services/authentication/forget_password/forget_password_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(SignInController());
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
    GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Pallete.Bg,
      body: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveWidget.isSmallScreen(context)
                    ? const SizedBox()
                    : Expanded(
                        child: Container(
                          color: Pallete.backgroundColor,
                          child: Center(
                            child: ListView(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: height * 0.1,
                                    ),
                                    Center(
                                      child: AvatarGlow(
                                        curve: Curves.easeOutSine,
                                        showTwoGlows: true,
                                        endRadius: 250,
                                        duration: const Duration(seconds: 5),
                                        glowColor: Pallete.gradient1,
                                        repeat: true,
                                        repeatPauseDuration:
                                            const Duration(milliseconds: 50),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Pallete.backgroundColor,
                                          maxRadius: 200,
                                          child: Image.asset(
                                            'images/iconRbg.png',
                                            fit: BoxFit.contain,
                                            height: 450,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dharma ',
                                          style: ralewayStyle.copyWith(
                                              fontSize: 48.0,
                                              color: Pallete.gradient2,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          'Pushtak',
                                          style: ralewayStyle.copyWith(
                                              fontSize: 48.0,
                                              color: Pallete.gradient1,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ResponsiveWidget.isSmallScreen(context)
                              ? height * 0.032
                              : height * 0.12),
                      color: Pallete.Bg,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.2,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Hey,',
                                style: ralewayStyle.copyWith(
                                    fontSize: 25.0, color: Colors.black)),
                            TextSpan(
                                text: 'Sign In ',
                                style: ralewayStyle.copyWith(
                                    color: Colors.black, fontSize: 25.0)),
                          ])),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Enter Your Account Details ',
                            style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.044,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Email / Phone',
                              style: ralewayStyle.copyWith(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Container(
                            height: 50.0,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Pallete.whiteColor),
                            child: Form(
                              key: formKey1,
                              child: TextFormField(
                                controller: controller.email,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                          .hasMatch(value)) {
                                    return "Enter Correct Email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(AppIcons.emailIcon),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      top: 14.0, right: 8.0),
                                  hintText: ' Enter Email/Phone number ',
                                  hintStyle: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.gradient2.withOpacity(0.5),
                                      fontSize: 12.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.014,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Password',
                              style: ralewayStyle.copyWith(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Container(
                            height: 50.0,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Pallete.whiteColor),
                            child: Form(
                              key: formKey2,
                              child: TextFormField(
                                controller: controller.password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "No Password is Entered";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(AppIcons.lock)),
                                  suffixIcon: null,
                                  contentPadding: const EdgeInsets.only(
                                      top: 14.0, right: 8.0),
                                  hintText: ' Enter Password ',
                                  hintStyle: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.gradient2.withOpacity(0.5),
                                      fontSize: 12.0),
                                ),
                                obscureText: _obscureText,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                style: const ButtonStyle(),
                                onPressed: () {
                                  ForgetPasswordScreen.ShowModelBottom(context);
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: Colors.black),
                                )),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Center(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (formKey1.currentState!.validate() &&
                                      formKey2.currentState!.validate()) {
                                    SignInController.instance.signInUser(
                                        controller.email.text.trim(),
                                        controller.password.text.trim());
                                  }
                                },
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Pallete.gradient1),
                                  child: Obx(() {
                                    final isLoading = SignInController
                                        .instance.isLoading.value;
                                    return isLoading
                                        ? SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Pallete.whiteColor,
                                              ),
                                              strokeWidth: 1.0,
                                            ),
                                          )
                                        : Text(
                                            'Sign In',
                                            style: ralewayStyle.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Pallete.whiteColor,
                                              fontSize: 13.0,
                                            ),
                                          );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Center(
                              child: Text(
                            'OR',
                            style: ralewayStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black.withOpacity(0.5)),
                          )),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () {},
                                    splashColor: Pallete.gradient1,
                                    child: SvgPicture.asset(
                                      AppIcons.glogo,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () {},
                                    splashColor: Pallete.gradient1,
                                    child: SvgPicture.asset(
                                      AppIcons.incognito,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: ralewayStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => const SignUp());
                                  },
                                  child: Text("Sign Up",
                                      style: ralewayStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Pallete.gradient1)))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
