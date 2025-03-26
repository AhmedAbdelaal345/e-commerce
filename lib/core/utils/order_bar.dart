

import 'package:flutter/material.dart';

class OrderBar extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text1;
  final Color textcol1;
  final Color backcol1;

  const OrderBar({
    super.key,
    this.onPressed,
    required this.text1,
    required this.textcol1,
    required this.backcol1,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backcol1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text1,
        style: TextStyle(
          color: textcol1,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}