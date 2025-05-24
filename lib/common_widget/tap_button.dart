import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class TapButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  final String icon;

  const TapButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.width * 0.07,
            width: size.width * 0.06,
            child: Image.asset(
              icon,
              color: isSelected ? Tcolor.main : Tcolor.placeholder,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: size.width * 0.032,
                color: isSelected ? Tcolor.main : Tcolor.placeholder,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
