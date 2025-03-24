import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({required this.label, super.key});
  final String label;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true; // Initially, the password is hidden

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the visibility state
    });
  }

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
            // Handle submission logic here
          },
          cursorColor: AppColor.red,
          obscureText: _obscureText, // Hide/show password based on the state
          decoration: InputDecoration(
            icon: SvgPicture.asset(AppAssets.password_icon),
            labelText: widget.label, // Use widget.label directly
            labelStyle: TextStyle(
              color: AppColor.labelText,
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
            hintText: "Enter Your PassWord",
            hintStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
            focusColor: AppColor.red,
            fillColor: Colors.white,
            iconColor: Colors.white,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _togglePasswordVisibility, // Toggle visibility on button press
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}