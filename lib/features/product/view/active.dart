import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/order_bar.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:final_projects/features/product/manager/product_cubit.dart';
import 'package:final_projects/features/product/manager/product_state.dart';
import 'package:final_projects/features/product/view/cancelled.dart';
import 'package:final_projects/features/product/view/compelete.dart';
import 'package:final_projects/features/orders/order_details.dart';
import 'package:final_projects/features/home/views/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Active extends StatelessWidget {
  const Active({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
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
                    return MyOrders();
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
 // Replace the body with:
body: BlocBuilder<OrderCubit, OrderState>(
  builder: (context, state) {
    if (state is OrderLoadingState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is OrderEmptyState) {
      return MyOrders(); // Show empty state
    } else if (state is OrderErrorState) {
      return Center(child: Text(state.error));
    } else if (state is OrderLoadedState) {
      final orders = state.activeOrders;
      if (orders.isEmpty) {
        return MyOrders(); // Show empty state
      }
      
      return Column(
        children: [
          // Your existing tab bar code...
          
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding: EdgeInsets.only(
                    top: 0.054 * screenheight,
                    left: 0.05067 * screenWidth,
                    right: 0.0693 * screenWidth,
                  ),
                  child: Container(
                    // Your existing container code...
                    child: Row(
                      children: [
                        Container(
                          width: 103,
                          height: 106,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(order['image']),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              // Your existing column code...
                              children: [
                                Row(
                                  children: [
                                    Text(order['productName']),
                                    Spacer(),
                                    Text("\$ ${order['price']}"),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(order['date']))),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OrderBar(
                                        onPressed: () {
                                          BlocProvider.of<OrderCubit>(context).cancelOrder(index);
                                        },
                                        text1: "Cancel",
                                        textcol1: AppColor.white,
                                        backcol1: AppColor.red,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: OrderBar(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => OrderDetails()),
                                          );
                                        },
                                        text1: "Track Driver",
                                        textcol1: AppColor.white,
                                        backcol1: AppColor.red,
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
            }