import 'package:dharmalib/repository/authentication_respo/authentication_respo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final isLoading = false.obs;

  void signInUser(String email, String password) async {
    try {
      isLoading.value = true; // Set loading state to true
      await AuthenticationRespo.instance.loginUserEmailPhone(email, password);
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}
