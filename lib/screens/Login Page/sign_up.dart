import 'package:dharmalib/services/authentication/controllers/signup_controller.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:dharmalib/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/authentication/password/password_checker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = Get.put(SignupController());
  final passwordController = Get.put(PasswordStrength());
  FocusNode focus = FocusNode();
  FocusNode focus1 = FocusNode();
  FocusNode focus3 = FocusNode();
  bool hasFocus = false;
  TextEditingController confirmController = TextEditingController();

  @override
  void initState() {
    focus.addListener(() {
      setState(() {
        hasFocus = focus.hasPrimaryFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form1 = GlobalKey<FormState>();
    GlobalKey<FormState> form2 = GlobalKey<FormState>();
    GlobalKey<FormState> form3 = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Pallete.Bg,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: height * 0.032),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 30.0),
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                        customBorder: CircleBorder(),
                        splashColor: Pallete.yellow,
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppIcons.back,
                          height: 30,
                          width: 30,
                        )),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Sign Up Here ',
                      style: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 25.0)),
                  TextSpan(
                      text: '👇',
                      style: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          //color: Pallete.yellow,
                          fontSize: 25.0))
                ])),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Fill the Details ',
                  style: ralewayStyle.copyWith(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.064,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Email/Phone',
                    style: ralewayStyle.copyWith(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Container(
                  height: 50.0,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Pallete.whiteColor),
                  child: Form(
                    key: form1,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                .hasMatch(value)) {
                          return 'Enter Correct Email or Phone Number';
                        } else {
                          return null;
                        }
                      },
                      controller: controller.email,
                      focusNode: focus1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focus);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.emailIcon),
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 14.0, right: 8.0),
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
                SizedBox(
                  height: 6.0,
                ),

                // 2nd Text Field Password
                Container(
                  height: 50.0,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Pallete.whiteColor),
                  child: Form(
                    key: form2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is Empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        passwordController.checkPassword(value);
                      },
                      focusNode: focus,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focus3);
                      },
                      controller: controller.password,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.lock)),
                        suffixIcon: null,
                        contentPadding:
                            const EdgeInsets.only(top: 14.0, right: 8.0),
                        hintText: ' Enter Password ',
                        hintStyle: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Pallete.gradient2.withOpacity(0.5),
                            fontSize: 12.0),
                      ),
                      //obscureText: _obscureText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                hasFocus
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => LinearProgressIndicator(
                                  value: passwordController.strength.value,
                                  backgroundColor: Colors.grey.shade300,
                                  color: passwordController.strength.value <=
                                          1 / 4
                                      ? Colors.red
                                      : passwordController.strength <= 2 / 4
                                          ? Colors.yellow
                                          : passwordController.strength <= 3 / 4
                                              ? Colors.blue
                                              : Colors.green,
                                  minHeight: 15,
                                )),
                            const SizedBox(height: 10),
                            Obx(() => Text(
                                  passwordController.displayText.value,
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ))
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 5,
                      ),
                Container(
                  height: 50.0,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Pallete.whiteColor),
                  child: Form(
                    key: form3,
                    child: TextFormField(
                      /*validator: (value) {
                            if (controller.email.toString() !=
                                confirmController.text) {
                              return "Passwords do not match";
                            } else {
                              return null;
                            }
                          },*/
                      focusNode: focus3,

                      controller: confirmController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.lock)),
                        suffixIcon: null,
                        contentPadding:
                            const EdgeInsets.only(top: 14.0, right: 8.0),
                        hintText: ' Re-Enter Password ',
                        hintStyle: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Pallete.gradient2.withOpacity(0.5),
                            fontSize: 12.0),
                      ),
                      //obscureText: _obscureText,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          if (form1.currentState!.validate() &&
                              form2.currentState!.validate() &&
                              form3.currentState!.validate()) {
                            SignupController.instance.registrationUser(
                                controller.email.text.trim(),
                                controller.password.text.trim());
                          }
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Pallete.yellow),
                          child: Text(
                            'Sign Up',
                            style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Pallete.whiteColor,
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Need Help?',
                    style: ralewayStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
