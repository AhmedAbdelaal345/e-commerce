import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/circle_avatar.dart';
import 'package:final_projects/core/utils/list_tile.dart';
import 'package:final_projects/features/get_started/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  bottom: screenheight * 0.02339,
                ),
                child: Image.asset(
                  AppAssets.profile,
                  fit: BoxFit.scaleDown,
                  width: 96,
                  height: 96,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: screenheight * 0.066),
                child: SizedBox(
                  child: Text(
                    'User full Name',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTileWidget(
                imageIcon: AppAssets.profileicon,
                text: "My profile",
                screan: Text("lm,fkj"),
              ),
              SizedBox(height: 0.044 * screenheight),
              ListTileWidget(
                imageIcon: AppAssets.bag,
                text: "My Orders",
                screan: Text("lm,fkj"),
              ),
              SizedBox(height: 0.044 * screenheight),

              ListTileWidget(
                imageIcon: AppAssets.heart,
                text: "My Favorites",
                screan: Text("lm,fkj"),
              ),
              SizedBox(height: 0.044 * screenheight),

              ListTileWidget(
                imageIcon: AppAssets.setting,
                text: "Settings",
                screan: Text("lm,fkj"),
              ),
              SizedBox(height: 0.0714 * screenheight),

              Divider(
                color: AppColor.red,
                endIndent: 33,
                indent: 33,
                thickness: 1,
              ),
              SizedBox(height: 0.054 * screenheight),
              ListTileWidget(
                imageIcon: AppAssets.logout,
                text: "Log Out",
                screan: Login(),
              ),
              SizedBox(height: 0.0714 * screenheight),
            ],
          ),
        ),
      ),
    );
  }
}
