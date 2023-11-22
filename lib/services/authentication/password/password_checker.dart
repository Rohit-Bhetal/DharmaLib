import 'package:get/get.dart';

class PasswordStrength extends GetxController {
  var password = ''.obs;
  var strength = 0.0.obs;
  var displayText = 'Enter a password'.obs;
  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  // 1: Great
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void checkPassword(String value) {
    password.value = value.trim();

    if (password.value.isEmpty) {
      strength.value = 0.0;
      displayText.value = 'Please enter a password';
    } else if (password.value.length < 6) {
      strength.value = 1 / 6;
      displayText.value = 'Password is Too short';
    } else if (password.value.length < 8) {
      strength.value = 2 / 4;
      displayText.value = 'Weak';
    } else if (!letterReg.hasMatch(password.value) ||
        !numReg.hasMatch(password.value)) {
      strength.value = 3 / 4;
      displayText.value = 'Strong';
    } else {
      strength.value = 1;
      displayText.value = 'Great';
    }
  }
}
