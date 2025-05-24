import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

enum ElevatedButtonType { bgPrimary, textPrimary }

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String image;
  final ElevatedButtonType type;
  const ElevatedButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.image,
      this.type = ElevatedButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 3,
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            backgroundColor:
                type == ElevatedButtonType.bgPrimary ? Tcolor.fb : Tcolor.white,
            side: BorderSide(color: Tcolor.textBox, width: 1),
            fixedSize: Size(size.width * 0.86, size.width * 0.14)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: type == ElevatedButtonType.bgPrimary ? 30 : 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: type == ElevatedButtonType.bgPrimary
                        ? Tcolor.white
                        : Tcolor.primary,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
