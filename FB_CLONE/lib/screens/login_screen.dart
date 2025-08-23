import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/custom_textformfield.dart';
import '../constants.dart';
import '../widgets/custom_inkwell_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String _validUsername = "user123";
  final String _validPassword = "password123";

  void _showCustomDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Validation Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _validateAndSubmit() {
    if (!_formKey.currentState!.validate()) {
      _showCustomDialog("All fields are required to continue.");
      return;
    }

    if (usernameController.text != _validUsername ||
        passwordController.text != _validPassword) {
      _showCustomDialog("Invalid username or password.");
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: usernameController.text, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(25)),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/fb_logo.jpg',
                        height: ScreenUtil().setHeight(200),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Username';
                          }
                          return null;
                        },
                        onSaved: (value) => usernameController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username',
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        onSaved: (value) => passwordController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      CustomInkwellButton(
                        onTap: _validateAndSubmit,
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have an account? ',
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: FB_LIGHT_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}