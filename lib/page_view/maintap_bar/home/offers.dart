import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class OffersItem extends StatefulWidget {
  const OffersItem({super.key});

  @override
  State<OffersItem> createState() => _OffersItemState();
}

class _OffersItemState extends State<OffersItem> {
  TextEditingController textSearch = TextEditingController();
  List popRes = [
    {
      "image": "assets/images/pop4.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "cafa",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop3.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "cafa",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop2.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "cafa",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "cafa",
      "food_type": "western Food"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Offers',
                style: TextStyle(
                    fontSize: 23,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 28,
                ),
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Find discounts, Offers special\nmeals and more!",
                      style: TextStyle(
                          fontSize: 18,
                          color: Tcolor.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          backgroundColor: Tcolor.main,
                          fixedSize: Size(size.width * 0.5, size.width * 0.09)),
                      child: Center(
                        child: Text(
                          "Check Offers",
                          style: TextStyle(
                              color: Tcolor.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: popRes.length,
                itemBuilder: ((context, index) {
                  var object2 = popRes[index] as Map? ?? {};
                  return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: InkWell(
                        onTap: () {},
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
                                  fontSize: 22,
                                  color: Tcolor.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
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
                                  object2["rate"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Tcolor.main,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  object2["rating"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Tcolor.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  object2["type"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Tcolor.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Text(
                                  object2["food_type"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Tcolor.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.width * 0.03,
                            ),
                          ],
                        ),
                      ));
                }),
              ),
            ))
          ],
        ));
  }
}
