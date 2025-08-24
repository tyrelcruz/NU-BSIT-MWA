import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontFamily,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.letterSpacing = 0,
    this.maxLines,
    this.overflow,
    this.fontStyle = FontStyle.normal,
    this.color,
  });
  final String text;
  final double fontSize, letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String? fontFamily;
  final FontStyle fontStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        color: color,
      ),
    );
  }
}
