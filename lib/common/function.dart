import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

void showMessage(
  ScaffoldMessengerState key, {
  String message,
  bool isError = false,
}) {
  final snackBar = SnackBar(
    backgroundColor: isError ? redColor : greenSecondaryColor,
    content: Text(
      message ?? 'Message',
      style: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontSize: 14,
      ),
    ),
  );
  key.showSnackBar(snackBar);
}
