import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  const CustomFont(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.fontFamily = 'Frutiger',
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left,
      this.letterSpacing = 0,
      this.fontStyle = FontStyle.normal});

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double letterSpacing;
  final String fontFamily;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
    );
  }
}
