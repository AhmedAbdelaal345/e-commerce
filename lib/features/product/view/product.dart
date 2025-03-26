import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/features/home/views/home.dart';
import 'package:final_projects/features/product/manager/product_state.dart';
import 'package:final_projects/features/product/view/active.dart';
import 'package:final_projects/features/product/manager/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: const _ProductContent(),
    );
  }
}

class _ProductContent extends StatefulWidget {
  const _ProductContent();

  @override
  State<_ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<_ProductContent> {
  int index = 1;
  double price = 100;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ),
          child: SvgPicture.asset(AppAssets.arrow_back, fit: BoxFit.scaleDown),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.093 * screenWidth,
                  vertical: 0.044 * screenheight,
                ),
                child: SizedBox(
                  width: 0.81 * screenWidth,
                  height: 0.37 * screenheight,
                  child: Image.asset(AppAssets.product1, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.067 * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mens Starry",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.022 * screenheight),
                    const Text(
                      "Vision Alta Men's Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.085 * screenheight),
                    Row(
                      children: [
                        Text(
                          "${price * index} \$",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.red,
                          ),
                        ),
                        const Spacer(),
                        // Decrease Quantity Button
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColor.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (index > 1) index--;
                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$index',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColor.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                index++;
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.1467 * screenheight,
                  left: 20,
                  right: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: BlocConsumer<OrderCubit, OrderState>(
                    listener: (context, state) {
                      if (state is OrderLoadedState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Active()),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          final cubit = context.read<OrderCubit>();
                          cubit.addOrder(
                            "Mens Starry",
                            price * index,
                            index,
                            AppAssets.product1,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.cart),
                            const SizedBox(width: 5),
                            const Text(
                              "Add To Cart",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
