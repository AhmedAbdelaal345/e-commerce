import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/app_strings.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/core/utils/password_textfield.dart';
import 'package:final_projects/core/utils/text_field_widget.dart';
import 'package:final_projects/features/get_started/get_started.dart';
import 'package:final_projects/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return GetStarted();
                },
              ),
            );
          },
          child: SvgPicture.asset(AppAssets.arrow_back, fit: BoxFit.scaleDown),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 32, right: 158),
              child: Container(
                width: 185,

                child: Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 32, top: 45),
              child: TextfiledWidget(
                hint: "Enter Your Full Name",
                label: "Full Name",
                icon: AppAssets.user,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 32, top: 10),
              child: TextfiledWidget(
                hint: "Enter Your Phone",
                label: "Phone",
                icon: AppAssets.call,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 32, top: 10),
              child: TextfiledWidget(
                hint: "Enter Your Email",
                label: "Email",
                icon: AppAssets.email_icon,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                right: 26,
                left: 32,
                top: 10,
                bottom: 10,
              ),
              child: PasswordTextField(label: "PassWord"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 32, bottom: 56),
              child: PasswordTextField(label: "Confirm PassWord"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29, left: 29),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButtonn(
                  screan: Home(),
                  color: AppColor.red,
                  text: Text(
                    AppStrings.login,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: AppColor.white,
                    ),
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
