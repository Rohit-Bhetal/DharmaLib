import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/constants.dart';
import '../ui_responsive/size_config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        color: AppColors.secondaryBg,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: const ColorFilter.mode(
                      AppColors.icongray, BlendMode.srcIn),
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.trending,
                  colorFilter: const ColorFilter.mode(
                      AppColors.icongray, BlendMode.srcIn),
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.fav,
                  colorFilter: const ColorFilter.mode(
                      AppColors.icongray, BlendMode.srcIn),
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.book,
                  colorFilter: const ColorFilter.mode(
                      AppColors.icongray, BlendMode.srcIn),
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.profile,
                  colorFilter: const ColorFilter.mode(
                      AppColors.icongray, BlendMode.srcIn),
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
