import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  final IconData? data;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.data,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 4,
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            backgroundColor:
                type == RoundButtonType.bgPrimary ? Tcolor.main : Tcolor.white,
            side: type == RoundButtonType.bgPrimary
                ? null
                : BorderSide(color: Tcolor.main, width: 1),
            fixedSize: Size(size.width * 0.86, size.width * 0.14)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: type == RoundButtonType.bgPrimary
                    ? Tcolor.white
                    : Tcolor.main,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
