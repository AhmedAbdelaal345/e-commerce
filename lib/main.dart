import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/features/checkout/placeOrder.dart';
import 'package:final_projects/features/home/views/cart.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:final_projects/features/myProfile/my_profile.dart';
import 'package:final_projects/features/onboarding/onboarding.dart';
import 'package:final_projects/features/product/manager/product_cubit.dart';
import 'package:final_projects/features/home/views/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => OrderCubit(),
      child: MaterialApp(
        home: OnBoardingPage(),
        // other routes
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.red),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => OnBoardingPage(),
        '/cart': (context) => Cart(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
