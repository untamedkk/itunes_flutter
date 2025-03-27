import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 13,
    this.textColor = Colors.black,
    this.maxLines = 1,
  });

  final String text;
  final double fontSize;
  final Color textColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: false,
      style: TextStyle(fontSize: fontSize, color: textColor),
    );
  }
}
