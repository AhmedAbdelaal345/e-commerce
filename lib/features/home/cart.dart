import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart' show AppColor;
import 'package:final_projects/core/utils/circle_avatar.dart';
import 'package:final_projects/features/product/product.dart';
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
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: AppColor.black.withOpacity(0.1),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppAssets.product1,
                          fit: BoxFit.cover, 
                          width: double.infinity,
                          height: 196,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Text(
                          "Mens Starry ${index + 1}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2,
                        ),
                        child: Text(
                          "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "₹399",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(AppAssets.star),
                      ),
                      FloatingActionButton(
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
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
