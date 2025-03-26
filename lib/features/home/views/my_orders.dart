import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/order_bar.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:final_projects/features/product/view/active.dart';
import 'package:final_projects/features/product/view/cancelled.dart';
import 'package:final_projects/features/product/view/compelete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Orders",
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
              padding: EdgeInsets.only(
                top: 0.054 * screenheight,
                left: 0.12 * screenWidth,
                right: 0.0693 * screenWidth,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Active();
                          },
                        ),
                      );
                    },
                    child: OrderBar(
                      text1: "Active",
                      textcol1: AppColor.pink,
                      backcol1: AppColor.red,
                    ),
                  ),
                  SizedBox(width: 0.013 * screenWidth),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Compelete();
                          },
                        ),
                      );
                    },
                    child: OrderBar(
                      text1: "Completed",
                      textcol1: AppColor.pink,
                      backcol1: AppColor.red,
                    ),
                  ),
                  SizedBox(width: 0.013 * screenWidth),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Cancelled();
                          },
                        ),
                      );
                    },
                    child: OrderBar(
                      text1: "Cancelled",
                      textcol1: AppColor.pink,
                      backcol1: AppColor.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.1576 * screenheight),
            SvgPicture.asset(AppAssets.order),
            Padding(
              padding: EdgeInsets.only(
                left: 0.1173 * screenWidth,
                top: 0.0504 * screenheight,
                right: 0.1173 * screenWidth,
              ),
              child: Container(
                width: 0.768 * screenWidth,
                height: 0.1034 * screenheight,
                child: Text(
                  "You don't have any active orders at this time",
                  style: TextStyle(
                    color: AppColor.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
