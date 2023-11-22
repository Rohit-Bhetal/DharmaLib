import 'package:dharmalib/firebase_options.dart';
import 'package:dharmalib/repository/authentication_respo/authentication_respo.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/ui_screen/dashboard/home_screen.dart';

void main() async {
  //First Im Intializing the Firebase
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform)
        .then((value) => Get.put(AuthenticationRespo()));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dharma Lib',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/Dashboard': (context) => Dashboard()
      },
    );
  }
}
