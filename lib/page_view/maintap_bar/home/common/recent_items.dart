import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class RecentItems extends StatelessWidget {
  const RecentItems({super.key, required this.object, required this.onTap});
  final Map object;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              object["image"].toString(),
              width: size.width * 0.23,
              height: size.width * 0.23,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width * 0.07,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                object["name"],
                style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    object["type"],
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: Tcolor.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    object["food_type"],
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: Tcolor.primary,
                        fontWeight: FontWeight.w600),
                  ),
                ],
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
                    object["rate"],
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: Tcolor.main,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    object["rating"],
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: Tcolor.primary,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
