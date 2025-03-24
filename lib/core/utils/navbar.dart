import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:flutter/material.dart';

const List<TabItem> items = [
  TabItem(icon: Icons.home, title: "Home"),
  TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
  TabItem(icon: Icons.account_box, title: 'Profile'),
];

class MyNaveBar extends StatefulWidget {
  const MyNaveBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyNaveBar> {
  int visit = 0; // This keeps track of the selected index.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomBarFloating(
          items: items,
          backgroundColor: AppColor.white,
          color: AppColor.gray,
          colorSelected: AppColor.red,
          indexSelected: visit,
          onTap: (int index) {
            setState(() {
              visit = index;
            });

            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/home');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/cart');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/profile');
                break;
            }
          },
        ),
      ],
    );
  }
}
