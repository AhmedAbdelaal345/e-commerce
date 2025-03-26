import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/order_bar.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:final_projects/features/product/manager/product_state.dart';
import 'package:final_projects/features/product/view/active.dart';
import 'package:final_projects/features/product/view/compelete.dart';
import 'package:final_projects/features/product/manager/product_cubit.dart';
import 'package:final_projects/features/home/views/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Cancelled extends StatelessWidget {
  const Cancelled({super.key});

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
                  builder: (context) => MyOrders(),
                ),
              );
            },
            child: SvgPicture.asset(
              AppAssets.arrow_back,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is OrderEmptyState) {
              return _buildEmptyState(context);
            } else if (state is OrderErrorState) {
              return Center(child: Text(state.error));
            } else if (state is OrderLoadedState) {
              final cancelledOrders = state.cancelledOrders;
              if (cancelledOrders.isEmpty) {
                return _buildEmptyState(context);
              }

              return Column(
                children: [
                  // Order Status Tabs
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.054 * screenheight,
                      left: 0.12 * screenWidth,
                      right: 0.0693 * screenWidth,
                    ),
                    child: Row(
                      children: [
                        OrderBar(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Active()),
                            );
                          },
                          text1: "Active",
                          textcol1: AppColor.red,
                          backcol1: AppColor.pink,
                        ),
                        SizedBox(width: 0.013 * screenWidth),
                        OrderBar(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Compelete()),
                            );
                          },
                          text1: "Completed",
                          textcol1: AppColor.red,
                          backcol1: AppColor.pink,
                        ),
                        SizedBox(width: 0.013 * screenWidth),
                        OrderBar(
                          onPressed: null, // Disabled for current page
                          text1: "Cancelled",
                          textcol1: AppColor.pink,
                          backcol1: AppColor.red,
                        ),
                      ],
                    ),
                  ),

                  // Cancelled Orders List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        top: 0.054 * screenheight,
                        left: 0.05067 * screenWidth,
                        right: 0.0693 * screenWidth,
                        bottom: 20,
                      ),
                      itemCount: cancelledOrders.length,
                      itemBuilder: (context, index) {
                        final order = cancelledOrders[index];
                        final formattedDate = DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(order['date']));

                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          width: double.infinity,
                          height: 0.13054 * screenheight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                          child: Row(
                            children: [
                              Container(
                                width: 103,
                                height: 106,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(order['image'] ?? AppAssets.product1),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            order['productName'] ?? "Product",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "\$ ${order['price']?.toStringAsFixed(2) ?? "0.00"}",
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(formattedDate),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(AppAssets.falsee),
                                                SizedBox(width: 8),
                                                Text(
                                                  "Order Cancelled",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // Order Status Tabs (same as above)
        Padding(
          padding: EdgeInsets.only(
            top: 0.054 * screenheight,
            left: 0.12 * screenWidth,
            right: 0.0693 * screenWidth,
          ),
          child: Row(
            children: [
              OrderBar(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Active()),
                  );
                },
                text1: "Active",
                textcol1: AppColor.red,
                backcol1: AppColor.pink,
              ),
              SizedBox(width: 0.013 * screenWidth),
              OrderBar(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Compelete()),
                  );
                },
                text1: "Completed",
                textcol1: AppColor.red,
                backcol1: AppColor.pink,
              ),
              SizedBox(width: 0.013 * screenWidth),
              OrderBar(
                onPressed: null,
                text1: "Cancelled",
                textcol1: AppColor.pink,
                backcol1: AppColor.red,
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
              "You haven't cancelled any orders",
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
    );
  }
}