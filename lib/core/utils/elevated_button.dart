import 'package:final_projects/core/cash_helper/cash_data.dart';
import 'package:final_projects/core/cash_helper/cash_helper.dart';
import 'package:final_projects/core/cash_helper/cash_helper_keys.dart';
import 'package:final_projects/core/localization/app_string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ElevatedButtonn extends StatelessWidget {
  ElevatedButtonn({
     this.screan,
    required this.color,
    required this.text,
    this.borderColor,
    this.onpressed
  });
  final Widget? screan;
  final Color color;
  final Widget text;
  final Color? borderColor;
  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Container(
        width: double.infinity,
        height: 25,
        child: ElevatedButton(
          
          onPressed:onpressed ??() async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return screan??Text("");
                },
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: borderColor ?? color, width: 2),
              ),
            ),
          ),
          child: text,
        ),
      ),
    );
  }
}
