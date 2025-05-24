import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class MenuItemsList extends StatelessWidget {
  final Map object;
  final VoidCallback onTap;
  const MenuItemsList({super.key, required this.object, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          margin:
              EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 10),
          child: Stack(
            children: [
              Image.asset(
                object["image"].toString(),
                width: size.width,
                height: size.width * 0.4,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: size.width * 0.23,
                child: Text(
                  object["name"],
                  style: TextStyle(
                      fontSize: 22,
                      color: Tcolor.secondary,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                top: size.width * 0.3,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 17,
                      color: Tcolor.main,
                    ),
                    SizedBox(
                      width: size.width * 0.005,
                    ),
                    Text(
                      object["rate"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Tcolor.main,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Text(
                      object["rating"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Tcolor.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Text(
                      object["type"],
                      style: TextStyle(
                          fontSize: 14,
                          color: Tcolor.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Text(
                      object["food_type"],
                      style: TextStyle(
                          fontSize: 14,
                          color: Tcolor.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
            ],
          )),
    );
  }
}
