import 'package:flutter/material.dart';
import 'package:market_app/widgets/dynamic_size.dart';

class MainText extends StatelessWidget {
  const MainText({super.key, required this.text, this.fontSize});

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sofia-Pro',
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? DynamicSize.screenHeight(context) * 0.0190,
      ),
    );
  }
}
