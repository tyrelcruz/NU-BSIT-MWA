import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/customfont.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  late String buttonType, buttonName;
  late Color fontColor, outlineColor;
  late dynamic onPressed;
  CustomButton({
    super.key,
    this.buttonType = 'elevated',
    required this.buttonName,
    this.fontColor = Colors.black,
    required this.onPressed,
    this.outlineColor = Colors.black,
  });
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    widget.buttonType = widget.buttonType.toLowerCase();
    if (widget.buttonType == 'outlined') {
      return OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(30),
            vertical: ScreenUtil().setHeight(10),
          ), // EdgeInsets.symmetric
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), // RoundedRectangleBorder
          side: BorderSide(color: widget.outlineColor),
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: ScreenUtil().setSp(12),
          color: widget.fontColor,
        ), // CustomFont
      ); // OutlinedButton
    } else if (widget.buttonType == 'text') {
      return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(30),
            vertical: ScreenUtil().setHeight(10),
          ), // EdgeInsets.symmetric
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), // RoundedRectangleBorder
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: ScreenUtil().setSp(12),
          color: widget.fontColor,
        ), // CustomFont
      ); // TextButton
    } else {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(30),
            vertical: ScreenUtil().setHeight(10),
          ), // EdgeInsets.symmetric
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), // RoundedRectangleBorder
        ),
        child: CustomFont(
          text: widget.buttonName,
          fontSize: ScreenUtil().setSp(12),
          color: widget.fontColor,
        ), // CustomFont
      ); // ElevatedButton
    }
  }
}
