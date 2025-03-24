import 'package:final_projects/features/checkout/checkout.dart';
import 'package:final_projects/features/home/cart.dart';
import 'package:final_projects/features/home/profile.dart';
import 'package:final_projects/features/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/circle_avatar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // Define a list of pages for the navigation
  final List<Widget> _pages = [
    HomeScreen(), // Home screen
    Cart(), // Cart screen
    Profile(), // Profile screen
  ];

  void _onFABPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Checkout();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current screen index
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFABPressed,
        backgroundColor: AppColor.red, // Set your preferred color
        tooltip: 'Add Item', // Add action for FAB
        child: SvgPicture.asset(AppAssets.bag2),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offwhite,
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.stylbar,
          fit: BoxFit.scaleDown,
          width: 100,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, bottom: 25, top: 17),
                child: Container(
                  child: Text(
                    "All Featured",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Spacer(flex: 1),
                CircleAvatarWidget(text: "Beauty", image: AppAssets.beauty),
                Spacer(flex: 1),
                CircleAvatarWidget(text: "Fashion", image: AppAssets.fashion),
                Spacer(flex: 1),
                CircleAvatarWidget(text: "Kids", image: AppAssets.kids),
                Spacer(flex: 1),
                CircleAvatarWidget(text: "Mens", image: AppAssets.men),
                Spacer(flex: 1),
                CircleAvatarWidget(text: "Womens", image: AppAssets.women),
                Spacer(flex: 1),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 30,
                top: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        key: ValueKey(1),
                        children: [
                          Image.asset(AppAssets.offer, width: 343, height: 189),
                          SvgPicture.asset(AppAssets.offer1),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        key: ValueKey(2),
                        children: [
                          Image.asset(AppAssets.offer, width: 343, height: 189),
                          SvgPicture.asset(AppAssets.offer1),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        key: ValueKey(3),
                        children: [
                          Image.asset(
                            AppAssets.offer,
                            fit: BoxFit.scaleDown,
                            width: 343,
                            height: 189,
                          ),
                          SvgPicture.asset(AppAssets.offer1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  "Recommended",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: AppColor.black.withOpacity(0.1),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Product();
                                },
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppAssets.product1,
                              fit:
                                  BoxFit
                                      .fill, // Use BoxFit.cover for better fit
                              width: double.infinity,
                              height: 196,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mens Starry ${index + 1}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "₹399",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset(AppAssets.star),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
