import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: AppColor.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Profile();
                },
              ),
            );
          },
          child: SvgPicture.asset(AppAssets.arrow_back, fit: BoxFit.scaleDown),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 22, top: 72),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Language",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: AppColor.black,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: AppColor.offwhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              alignment: Alignment.center,
              width: 51,
              height: 36,
              child: Text(
                "Ar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppColor.red,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              alignment: Alignment.center,
              width: 51,
              height: 36,
              child: Text(
                "En",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
