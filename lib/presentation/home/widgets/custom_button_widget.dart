import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconsize = 30,
    this.textsize = 15,
  });
  final IconData icon;
  final String text;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textsize),
        ),
      ],
    );
  }
}
