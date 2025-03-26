import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/core/utils/catogry_item.dart';
import 'package:final_projects/core/utils/productCard.dart';
import 'package:final_projects/features/checkout/checkout.dart';
import 'package:final_projects/features/home/views/cart.dart';
import 'package:final_projects/features/home/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int currentCarouselIndex = 0;
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  final List<Map<String, String>> categories = [
    {"title": "Beauty", "image": AppAssets.beauty},
    {"title": "Fashion", "image": AppAssets.fashion},
    {"title": "Kids", "image": AppAssets.kids},
    {"title": "Mens", "image": AppAssets.men},
    {"title": "Womens", "image": AppAssets.women},
  ];

  void _onFABPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Checkout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _currentIndex == 0
              ? AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: SvgPicture.asset(AppAssets.stylbar),
              )
              : null,
      body: _buildCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColor.red,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.red,
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.red,
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton:
          _currentIndex == 0
              ? FloatingActionButton(
                onPressed: _onFABPressed,
                backgroundColor: AppColor.red,
                tooltip: 'Add Item',
                child: SvgPicture.asset(AppAssets.bag2),
              )
              : null,
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const Cart();
      case 2:
        return const Profile();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(
                  color: AppColor.offwhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Search Any Product",
                prefixIcon: Icon(Icons.search, color: AppColor.white),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "All Featured",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return CategoryItem(
                    imagePath: categories[index]["image"]!,
                    title: categories[index]["title"]!,
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                aspectRatio: 1,
                viewportFraction: 1,
                autoPlayCurve: Curves.ease,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentCarouselIndex = index;
                  });
                },
              ),
              items:
                  [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.offer),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "50-40% OFF",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Now in (product)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "All colours",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    side: const BorderSide(
                                      color: AppColor.white,
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Cart();
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Shop Now",
                                          style: TextStyle(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: AppColor.white,
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
                    );
                  }).toList(),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: currentCarouselIndex.toDouble(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Recommended",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: 2,
              itemBuilder: (context, index) => const ProductCard(),
            ),
          ],
        ),
      ),
    );
  }
}