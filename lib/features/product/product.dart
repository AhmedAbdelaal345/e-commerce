import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int index = 1;
  double price = 100;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ),
            );
          },
          child: SvgPicture.asset(AppAssets.arrow_back, fit: BoxFit.scaleDown),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 0.093 * screenWidth,
              right: 0.093 * screenWidth,
            ),
            child: SizedBox(
              child: Image.asset(AppAssets.product1, fit: BoxFit.fill),
              width: 0.81 * screenWidth,
              height: 0.37 * screenheight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 0.067 * screenWidth,
              top: 0.044 * screenheight,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mens Starry ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 0.067 * screenWidth,
              top: 0.022 * screenheight,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Vision Alta Men’s Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 0.085 * screenheight),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.067 * screenWidth),
                child: Text(
                  "${price * index} \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.red,
                  ),
                ),
              ),
              Spacer(flex: 1),

              // Decrease Quantity Button
              SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(30, 30)),
                    backgroundColor: MaterialStateProperty.all(AppColor.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (index > 1) index--; // Ensure index doesn't go below 1
                    });
                  },
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '$index',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              SizedBox(width: 8),

              SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColor.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      index++;
                      print(index); // Increase the index when "+" is pressed
                    });
                  },
                  child: Text(
                    "+",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 24),
            ],
          ),
          SizedBox(height: 0.1467 * screenheight),
          SizedBox(
            height: 52,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ElevatedButtonn(
                screan: Text("lkdsn"),
                color: AppColor.red,
                text: Row(
                  children: [
                    SizedBox(width: 147),
                    SvgPicture.asset(AppAssets.cart),
                    SizedBox(width: 5),
                    Text(
                      "Add To Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
