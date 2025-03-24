import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAvatarWidget extends StatelessWidget {
  CircleAvatarWidget({this.text, required this.image, super.key});
  final String image;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SizedBox(
            width: 40, // Set a fixed width for the SVG
            height: 40, // Set a fixed height for the SVG
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 4),
        Text(
          text ?? "welcome",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}
