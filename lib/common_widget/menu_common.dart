import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class MenuCommon extends StatelessWidget {
  final Map object;
  final VoidCallback onTap;
  const MenuCommon({super.key, required this.object, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Container(
                  width: size.width * 0.84,
                  height: size.width * 0.23,
                  decoration: BoxDecoration(
                      color: Tcolor.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          offset: Offset(0, 4),
                        )
                      ]),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundImage: AssetImage(
                      object["image"].toString(),
                    ),
                  ),
                  SizedBox(width: size.width * 0.07),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(object["name"].toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Tcolor.primary,
                          )),
                      Text(object["items_count"].toString(),
                          style: TextStyle(color: Tcolor.secondary)),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 320,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Tcolor.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Tcolor.placeholder)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child:
                    Icon(Icons.arrow_forward_ios_rounded, color: Tcolor.main),
              ),
            )
          ],
        ),
      ),
    );
  }
}
