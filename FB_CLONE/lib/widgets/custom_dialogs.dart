import '../constants.dart';
import 'package:flutter/material.dart';

void validateAndRegister({
  required BuildContext context,
  required String firstName,
  required String lastName,
  required String mobileNum,
  required String password,
  required String confirmPassword,
}) {
  if (firstName.isEmpty ||
      lastName.isEmpty ||
      mobileNum.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty) {
    customDialog(context, title: "Error", content: "All fields are required.");
    return;
  }

  if (mobileNum.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(mobileNum)) {
    customDialog(context,
        title: "Invalid Mobile Number",
        content: "Mobile number must be exactly 11 digits.");
    return;
  }

  if (password.length < 8 ||
      !RegExp(r'[A-Z]').hasMatch(password) ||
      !RegExp(r'[a-z]').hasMatch(password) ||
      !RegExp(r'[0-9]').hasMatch(password) ||
      !RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
    customDialog(context,
        title: "Weak Password",
        content:
            "Password must be at least 8 characters long and include uppercase, lowercase, a number, and a special character.");
    return;
  }

  if (password != confirmPassword) {
    customDialog(context,
        title: "Password Mismatch", content: "Passwords do not match.");
    return;
  }

  // If all validations pass
  customDialog(context, title: "Success", content: "Registration successful!");
}

void customDialog(BuildContext context,
    {required String title, required String content}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(
        child: Text('Okay'),
        style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
