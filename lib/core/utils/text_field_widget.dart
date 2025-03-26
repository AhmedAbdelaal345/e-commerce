import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class TextfiledWidget extends StatelessWidget {
  TextfiledWidget({
    required this.hint,
    required this.label,
    // required this.controler,
    required this.icon,
     this.control,
    this.onchange,
    this.ispassword,
    super.key,
  });
  // TextEditingController controler;
  String label;
  String hint;
  String icon;
  bool? ispassword;
  TextEditingController? control;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: BoxDecoration(
        color: AppColor.offwhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: TextField(
          onSubmitted: (value) {
            AppColor.red;
          },
          cursorColor: AppColor.red,
          // controller: controler,
          obscureText: ispassword ?? false,
          decoration: InputDecoration(
            icon: SvgPicture.asset(icon),
            labelText: "$label",
            labelStyle: TextStyle(
              color: AppColor.labelText,
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
            hintText: "$hint",
            hintStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
            focusColor: AppColor.red,

            fillColor: Colors.white,
            iconColor: Colors.white,
            isDense: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          controller:control ,
          onChanged: onchange,
        ),
      ),
    );
  }
}
