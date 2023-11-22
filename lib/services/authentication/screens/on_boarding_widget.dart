import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/constants.dart';
import '../../../utils/style.dart';

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toOnBoardingPage3Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            ImageApp.onBoarding3,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ' "It is by the wonder of the five-syllabled mantra that the worlds, the Vedas, the rishis, the dharma, the universe and the devas exist. AUM Namah Sivayah is the seed of all the living."- SIVA PURANA',
              style: ralewayStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Journey to the Supreme Consciousness',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '3/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toOnBoardingPage2Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            ImageApp.onBoarding2,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '“You are what you believe in. You become that which you believe you can become"― Bhagavad Gita',
              style: ralewayStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Divine Knowledge Unveiled by The Supreme',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '2/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toOnBoardingPage1Color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            ImageApp.onBoarding1,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '"The ultimate aim of yoga is to reach self-realization and merge with the divine consciousness." - Patanjali\'s Yoga Sutras',
              style: ralewayStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Enlight Yourself with Divine Knowledge',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '1/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
