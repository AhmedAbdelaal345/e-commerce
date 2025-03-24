import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/check_out_container.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  double screenWidth = 0;
  double screenHeight = 0;
  double totalPrice = 0.0;
  final Map<String, double> itemPrices =
      {}; // To track each item's current price

  void _updateTotalPrice(String itemId, double newPrice) {
    setState(() {
      itemPrices[itemId] = newPrice;
      totalPrice = itemPrices.values.fold(0.0, (sum, price) => sum + price);
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.arrow_back, width: 24, height: 24),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.map),
                  SizedBox(width: 8),
                  Text(
                    "Shopping List",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),//
            Padding(
              padding: EdgeInsets.only(left: 0.080 * screenWidth),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 0.64 * screenWidth,
                  height: 0.097 * screenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 14,
                        spreadRadius: -8,
                        offset: const Offset(0, 6),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      BoxShadow(
                        blurRadius: 9,
                        spreadRadius: -7,
                        offset: const Offset(0, -4),
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '''   Type address here 
                   or pick from map''',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ChkContainer(
              text: "Women's Casual Wear",
              rate: '4.8',
              imge: AppAssets.girle,
              price: 34.00,
              onQuantityChanged:
                  (newPrice) => _updateTotalPrice('women_casual', newPrice),
            ),
            SizedBox(height: 0.0283 * screenHeight),
            ChkContainer(
              text: "Men's Jacket",
              rate: '4.7',
              imge: AppAssets.man,
              price: 45,
              onQuantityChanged:
                  (newPrice) => _updateTotalPrice('men_jacket', newPrice),
            ),
            SizedBox(height: 0.0283 * screenHeight),
            Divider(endIndent: 10, indent: 10),
            SizedBox(height: 0.0283 * screenHeight),

            SizedBox(
              height: 55,
              child: ElevatedButtonn(
                screan: Text("Thank you For Use Our App"),
                color: AppColor.red,
                text: Text(
                  "Checkout",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.025 * screenHeight),
          ],
        ),
      ),
    );
  }
}
