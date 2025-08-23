import 'package:myapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.validator,
    required this.onSaved,
    this.controller = TextEditingController,
    this.isObscure = false,
    required this.fontSize,
    required this.fontColor,
    this.hintTextSize = 12,
    this.hintText = '',
    this.fillColor = Colors.black12,
    required this.height,
    required this.width,
    this.keyboardType = TextInputType.text,
    this.maxLength = 200,
  });
  final validator;
  final onSaved;
  final controller;
  bool isObscure;
  final fontSize;
  final fontColor;
  final double height, width;
  final hintTextSize;
  final hintText;
  final fillColor;
  TextInputType keyboardType;
  int maxLength;
 
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
 
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void _toggleView() {
    setState(() {
      widget.isObscure = !widget.isObscure;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onSaved: widget.onSaved,
      controller: widget.controller,
      obscureText: widget.isObscure,
      keyboardType: widget.keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
      style: TextStyle(fontSize: widget.fontSize, color: widget.fontColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
            widget.width, widget.height, widget.width, widget.height),
        focusColor: Colors.black12,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: FB_DARK_PRIMARY,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: FB_DARK_PRIMARY,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        errorStyle: const TextStyle(fontFamily: 'Frutiger'),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: FB_DARK_PRIMARY,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.black12,
          fontSize: widget.hintTextSize,
          fontFamily: 'Frutiger',
        ),
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        suffixIcon: widget.hintText == 'Password'
            ? IconButton(
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: FB_DARK_PRIMARY,
                ),
                onPressed: () {
                  _toggleView();
                },
              )
            : null,
      ),
    );
  }
}