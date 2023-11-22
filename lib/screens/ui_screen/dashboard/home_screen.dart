import 'package:dharmalib/screens/ui_screen/dashboard/app_action_bar.dart';
import 'package:dharmalib/services/books_data/trending_list.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.Bg,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarAction(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Pallete.whiteColor),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(top: 10, right: 8),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.search)),
                        hintText: ' Search ',
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Pallete.gradient2.withOpacity(0.5),
                            fontSize: 11.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New & Trending",
                          style: GoogleFonts.poppins(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('See All',
                                style: GoogleFonts.poppins(
                                    color: Pallete.gradient1,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)))
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryBg),
                    child: const BookListTrendingView(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
