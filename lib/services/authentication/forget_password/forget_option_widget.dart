import 'package:flutter/material.dart';

import '../../../utils/style.dart';

class OptionVer extends StatelessWidget {
  const OptionVer({
    Key? key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final IconData btnIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200),
        child: Row(children: [
          Icon(
            btnIcon,
            size: 60.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ralewayStyle.copyWith(
                    fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle,
                style: ralewayStyle.copyWith(
                    fontSize: 12.0, fontWeight: FontWeight.w300),
              )
            ],
          )
        ]),
      ),
    );
  }
}
