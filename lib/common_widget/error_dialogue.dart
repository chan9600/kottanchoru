import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class ErrorDialogue extends StatelessWidget {
  final String message;
  final String title;
  const ErrorDialogue({super.key, required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      content: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Tcolor.main),
        ),
        subtitle: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Tcolor.secondary,
          ),
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Tcolor.main,
              fixedSize: const Size(200, 40),
            ),
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Tcolor.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
