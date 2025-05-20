import 'package:flutter/material.dart';
import 'package:market_app/utilities/app_colors.dart';

import 'dynamic_size.dart';

class SubText extends StatelessWidget {
  const SubText({super.key, required this.text, this.fontSize});

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.subTextColor,
        fontSize: fontSize ?? DynamicSize.screenHeight(context) * 0.0190,
      ),
    );
  }
}
