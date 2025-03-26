import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart' show AppColor;
import 'package:final_projects/core/utils/circle_avatar.dart';
import 'package:final_projects/core/utils/productCard.dart';
import 'package:final_projects/features/product/view/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offwhite,
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.stylbar,
          fit: BoxFit.scaleDown,
          width: 100,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22, bottom: 25, top: 17),
              child: Container(
                child: Text(
                  "All Featured",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16),
                CircleAvatarWidget(text: "Beauty", image: AppAssets.beauty),
                SizedBox(width: 16),
                CircleAvatarWidget(text: "Fashion", image: AppAssets.fashion),
                SizedBox(width: 16),
                CircleAvatarWidget(text: "Kids", image: AppAssets.kids),
                SizedBox(width: 16),
                CircleAvatarWidget(text: "Mens", image: AppAssets.men),
                SizedBox(width: 16),
                CircleAvatarWidget(text: "Womens", image: AppAssets.women),
                SizedBox(width: 16),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "Recommended",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          SizedBox(
            height: 400,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: 8,
              itemBuilder: (context, index) => const ProductCard(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: SvgPicture.asset(AppAssets.bag2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Product();
                    },
                    settings: RouteSettings(),
                  ),
                );
              },
              backgroundColor: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}