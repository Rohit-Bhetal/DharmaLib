import 'package:dharmalib/screens/Login%20Page/login_screen.dart';
import 'package:dharmalib/screens/Login%20Page/sign_up.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:dharmalib/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [OnBoardingPage1(), OnBoardingPage2(), OnBoardingPage3()];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            enableLoop: false,
          ),
          Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () {
                  int nextPage = controller.currentPage + 1;
                  if (controller.currentPage == 2) {
                    Get.to(() => LoginScreen());
                  } else {
                    controller.animateToPage(page: nextPage);
                  }
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    foregroundColor: Colors.white),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 50,
              right: 20,
              child: currentPage == 1
                  ? TextButton(
                      onPressed: () {
                        controller.jumpToPage(page: 2);
                      },
                      child: Text(
                        'Skip',
                        style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    )
                  : const SizedBox()),
          Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: ScrollingDotsEffect(
                    activeDotColor: Colors.black, dotHeight: 5.0),
              ))
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
