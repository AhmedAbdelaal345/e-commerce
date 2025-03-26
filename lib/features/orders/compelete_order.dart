import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/check_out_container.dart';
import 'package:final_projects/core/utils/elevated_button.dart';
import 'package:final_projects/features/checkout/placeOrder.dart';
import 'package:final_projects/features/product/view/cancelled.dart';
import 'package:final_projects/features/home/views/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CompeleteOrder extends StatefulWidget {
  const CompeleteOrder({super.key});

  @override
  State<CompeleteOrder> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<CompeleteOrder> {
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

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.026 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order No. and Status
              Row(
                children: [
                  Text(
                    "Order No. 005",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "Completed",
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Date: $formattedDate",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              
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

              // Price Breakdown
              _buildPriceRow("Subtotal", totalPrice),
              _buildPriceRow("Tax and Fees", tax),
              _buildPriceRow("Delivery Fee", deliv),

              SizedBox(height: 0.0283 * screenHeight),
              Divider(endIndent: 10, indent: 10),

              // Order Total
              _buildPriceRow(
                "Order Total",
                deliv + tax + totalPrice,
                color: AppColor.red,
              ),

              SizedBox(height: 0.025 * screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build price row
  Widget _buildPriceRow(String title, double amount, {Color color = Colors.black}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.014 * screenHeight),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Text(
            "\$ ${amount.toStringAsFixed(2)}", // Format to 2 decimal places
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
