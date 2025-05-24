import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const TextButtonWidget(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: h * 0.017, color: Tcolor.main),
      ),
    );
  }
}
