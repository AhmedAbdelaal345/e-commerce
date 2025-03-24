import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/features/get_started/login.dart';
import 'package:final_projects/features/get_started/register.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            AppAssets.getStarted,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withAlpha(160),
                  Colors.black.withAlpha(0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'You want Authentic, here you go! ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    right: 38,
                    left: 38,
                    bottom: 24,
                  ),
                  child: Text(
                    'Find it here, buy it now!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 55,
                    right: 55,
                    bottom: 15,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButtonn(
                      screan: Login(),
                      color: AppColor.red,
                      text: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 55),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButtonn(
                      color: Colors.white,
                      screan: Register(),
                      borderColor: AppColor.red,
                      text: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: AppColor.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
