import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChkContainer extends StatefulWidget {
  const ChkContainer({
    required this.text,
    super.key,
    required this.rate,
    required this.imge,
    required this.price,
    required this.onQuantityChanged, // Add this callback
  });

  final String text;
  final String rate;
  final String imge;
  final double price;
  final Function(double) onQuantityChanged; // Callback for quantity changes

  @override
  State<ChkContainer> createState() => _ChkContainerState();
}

class _ChkContainerState extends State<ChkContainer> {
  double index = 1.00;
  double screenWidth = 0;
  double screenHeight = 0;

  // When quantity changes, update the parent
  void _updateQuantity(double newIndex) {
    setState(() {
      index = newIndex;
    });
    widget.onQuantityChanged(widget.price * index);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.082 * screenWidth),
      child: Container(
        width: double.infinity,
        height: 0.27 * screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 131,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(widget.imge),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 0.024 * screenWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.rate,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          AppAssets.star1,
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "\$ ${widget.price * index} \t",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          "\$ ${(widget.price * index) * 2}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(left: 0.242 * screenWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(AppColor.red),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (index > 1) {
                                  _updateQuantity(index - 1);
                                }
                              },
                              child: const Text(
                                "-",
                                textAlign: TextAlign.center,
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
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 40,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(AppColor.red),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _updateQuantity(index + 1);
                              },
                              child: const Text(
                                "+",
                                textAlign: TextAlign.center,
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
                    ),
                    Divider(endIndent: 10, indent: 10),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Text(
                          "Total Order ($index)   :",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(flex: 1),
                        Padding(
                          padding: EdgeInsets.only(right: 0.0267 * screenWidth),
                          child: Text("\$ ${widget.price * index}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}