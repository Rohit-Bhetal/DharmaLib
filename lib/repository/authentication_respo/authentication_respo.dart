import 'package:dharmalib/repository/authentication_respo/exceptions/signup_email_password_failure.dart';
import 'package:dharmalib/screens/Login%20Page/login_screen.dart';
import 'package:dharmalib/screens/ui_screen/dashboard/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRespo extends GetxController {
  static AuthenticationRespo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserEmailPhone(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupEPFailure.code(e.code);
      print('Firebase AUTH exception -${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupEPFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserEmailPhone(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password provided for that user.');
      }
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
