import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/features/checkout/placeOrder.dart';
import 'package:final_projects/features/home/cart.dart';
import 'package:final_projects/features/home/home.dart';
import 'package:final_projects/features/home/profile.dart';
import 'package:final_projects/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.red),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => PlaceOrder(),
        '/cart': (context) => Cart(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
