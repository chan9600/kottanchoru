import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

void snack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      message,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    )),
    backgroundColor: message == "Signup Successfully" || message == "message"
        ? Colors.green
        : Tcolor.main,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    )),
    duration: const Duration(milliseconds: 900),
  ));
}
