import 'package:dharmalib/repository/authentication_respo/authentication_respo.dart';
import 'package:dharmalib/screens/ui_screen/dashboard/pop_profile_menu.dart';
import 'package:dharmalib/utils/app_icons.dart';
import 'package:dharmalib/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.bell,
              width: 20.0,
            )),
        SizedBox(
          width: 10.0,
        ),
        PopUpMenu(
          menuList: [
            PopupMenuItem(
                child: GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: SvgPicture.asset(AppIcons.profile),
                title: Text('My Profile'),
              ),
            )),
            PopupMenuItem(
                child: GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: SvgPicture.asset(AppIcons.setting),
                title: Text('Setting'),
              ),
            )),
            PopupMenuItem(
                child: GestureDetector(
              onTap: () {
                AuthenticationRespo.instance.logout();
              },
              child: ListTile(
                leading: SvgPicture.asset(AppIcons.logout),
                title: Text('Log out'),
              ),
            ))
          ],
          icon: CircleAvatar(
            radius: 17,
            backgroundColor: Pallete.whiteColor,
            child: SvgPicture.asset(
              AppIcons.profile,
              height: 20,
            ),
          ),
        )
      ],
    );
  }
}
