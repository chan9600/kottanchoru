import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key, required this.onTap, required this.object2});

  final Map object2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            object2["image"].toString(),
            width: size.width,
            height: size.width * 0.4,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          Text(
            object2["name"],
            style: TextStyle(
                fontSize: size.width * 0.04,
                color: Tcolor.primary,
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: size.width * 0.03,
                color: Tcolor.main,
              ),
              SizedBox(
                width: size.width * 0.005,
              ),
              Text(
                object2["rate"],
                style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Tcolor.main,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                object2["rating"],
                style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                object2["type"],
                style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                object2["food_type"],
                style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
