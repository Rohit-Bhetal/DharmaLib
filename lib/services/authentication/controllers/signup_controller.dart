import 'package:dharmalib/repository/authentication_respo/authentication_respo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();

  void registrationUser(String email, String password) async {
    try {
      AuthenticationRespo.instance.createUserEmailPhone(email, password);
    } catch (e) {
      print(e);
    }
  }
}
