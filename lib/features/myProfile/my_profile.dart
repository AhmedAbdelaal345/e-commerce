import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/core/utils/text_field_widget.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
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
            child: SvgPicture.asset(
              AppAssets.arrow_back,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: screenheight * 0.176),
              child: Stack(
                children: [
                  Image.asset(
                    AppAssets.profile,
                    fit: BoxFit.scaleDown,
                    width: 96,
                    height: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75, top: 64),
                    child: CircleAvatar(
                      backgroundColor: AppColor.offwhite,
                      radius: 15,
                      child: CircleAvatar(
                        backgroundColor: AppColor.blue,
                        radius: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 28),
              child: TextfiledWidget(
                hint: "Full Name",
                label: "Full Name",
                icon: AppAssets.user,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 28,
                top: screenheight * 0.0267,
                bottom: 0.092 * screenheight,
              ),
              child: TextfiledWidget(
                hint: "Enter Your Number",
                label: "Phone Number",
                icon: AppAssets.call,
              ),
            ),
            SizedBox(
              height: 55,
              child: ElevatedButtonn(
                color: AppColor.red,
                screan: Text("data"),
                text: Text(
                  "Save",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
