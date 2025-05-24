import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.onTap,
    required this.object2,
  });

  final Map object2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              object2["countryImage"].toString(),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            object2["countryName"],
            style: TextStyle(
                fontSize: size.width * 0.04,
                color: Tcolor.primary,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
