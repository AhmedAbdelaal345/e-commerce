import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/check_out_container.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/features/checkout/placeOrder.dart';
import 'package:final_projects/features/home/views/home.dart';
import 'package:final_projects/features/product/view/cancelled.dart';
import 'package:final_projects/features/orders/compelete_order.dart';
import 'package:final_projects/features/home/views/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double screenWidth = 0;
  double screenHeight = 0;
  double totalPrice = 0.0;
  double tax = 3.00;
  double deliv = 2.00;
  final Map<String, double> itemPrices =
      {}; // To track each item's current price

  void _updateTotalPrice(String itemId, double newPrice) {
    setState(() {
      itemPrices[itemId] = newPrice;
      totalPrice = itemPrices.values.fold(0.0, (sum, price) => sum + price);
    });
  }

  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Details",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.arrow_back, width: 24, height: 24),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyOrders()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Padding(
              padding: EdgeInsets.only(
                left: 0.026 * screenWidth,
                bottom: 0.014 * screenHeight,
              ),
              child: Row(
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "\$ ${totalPrice.toStringAsFixed(2)}", // Format to 2 decimal places
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 0.030 * screenWidth),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0.026 * screenWidth,
                bottom: 0.014 * screenHeight,
              ),
              child: Row(
                children: [
                  const Text(
                    "Tax and Fees",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "\$ ${tax.toStringAsFixed(2)}", // Format to 2 decimal places
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 0.030 * screenWidth),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0.026 * screenWidth,
                bottom: 0.014 * screenHeight,
              ),
              child: Row(
                children: [
                  const Text(
                    "Delivery Fee",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "\$ ${deliv.toStringAsFixed(2)}", // Format to 2 decimal places
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 0.030 * screenWidth),
                ],
              ),
            ),
            SizedBox(height: 0.0283 * screenHeight),
            Divider(endIndent: 10, indent: 10),
            Padding(
              padding: EdgeInsets.only(
                left: 0.026 * screenWidth,
                bottom: 0.071 * screenHeight,
              ),
              child: Row(
                children: [
                  const Text(
                    "Order Total",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "\$ ${(deliv + tax + totalPrice).toStringAsFixed(2)}", // Format to 2 decimal places
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.red,
                    ),
                  ),
                  SizedBox(width: 0.030 * screenWidth),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 26,
                  width: 110,
                  child: ElevatedButtonn(
                    screan: Cancelled(),
                    color: AppColor.red,
                    text: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0.05867 * screenWidth),
                SizedBox(
                  height: 26,
                  width: 110,
                  child: Expanded(
                    child: ElevatedButtonn(
                      screan: CompeleteOrder(),
                      color: AppColor.red,
                      text: Text(
                        "Track Driver",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.025 * screenHeight),
          ],
        ),
      ),
    );
  }
}
