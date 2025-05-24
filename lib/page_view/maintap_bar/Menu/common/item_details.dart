import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/provider.dart';

import 'package:provider/provider.dart';

class ItemDetails extends StatelessWidget {
  final String image;
  final String title;
  final String rate;
  final String description;

  const ItemDetails({
    super.key,
    required this.image,
    required this.title,
    required this.rate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NumbersListProvider>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Tcolor.primary,
                size: 30,
              ),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 250),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Tcolor.primary,
                  size: 28,
                ),
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Image.asset(
                  image,
                  width: size.width,
                  height: 330,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  height: 335,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 300,
                            ),
                            child: Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Tcolor.main,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Tcolor.main,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Tcolor.main,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Tcolor.main,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  size: 18,
                                                  color: Tcolor.main,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '4 Start Ratings',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Tcolor.main),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Text(
                                            "Rs:${rate.toString()}",
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Tcolor.secondary),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Customize your order',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 300,
                                        height: 35,
                                        color: Tcolor.textBox,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            const Text(
                                              '- Select the ingredients -',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_sharp))
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Number of Items',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                value.sub();
                                              },
                                              child: Container(
                                                width: 45,
                                                height: 30,
                                                decoration:
                                                    BoxDecoration(
                                                        color: Tcolor.main,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        28),
                                                                right: Radius
                                                                    .circular(
                                                                        28))),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.horizontal_rule,
                                                    color: Tcolor.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 45,
                                              height: 30,
                                              decoration:
                                                  BoxDecoration(
                                                      color: Tcolor.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Tcolor.main),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .horizontal(
                                                              left:
                                                                  Radius
                                                                      .circular(
                                                                          28),
                                                              right: Radius
                                                                  .circular(
                                                                      28))),
                                              child: Center(
                                                  child: Text(
                                                value.numbers.last.toString(),
                                                style: TextStyle(
                                                    color: Tcolor.main,
                                                    fontSize: 15),
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                value.add();
                                              },
                                              child: Container(
                                                width: 45,
                                                height: 30,
                                                decoration:
                                                    BoxDecoration(
                                                        color: Tcolor.main,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        28),
                                                                right: Radius
                                                                    .circular(
                                                                        28))),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Tcolor.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 30,
                            color: Colors.white,
                          ),
                          Container(
                            width: size.width,
                            height: 200,
                            color: Tcolor.white,
                            child: Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      color: Tcolor.main,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(28),
                                          bottomRight: Radius.circular(28))),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 30,
                                  child: Container(
                                    width: 280,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              color: Tcolor.secondary)
                                        ],
                                        color: Tcolor.white,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topLeft: Radius.circular(35),
                                            bottomLeft: Radius.circular(35))),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Total Price',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Tcolor.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          value.amount.last.toString(),
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 170,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Tcolor.main,
                                                borderRadius: const BorderRadius
                                                    .horizontal(
                                                    left: Radius.circular(28),
                                                    right:
                                                        Radius.circular(28))),
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.add_shopping_cart,
                                                  color: Tcolor.white,
                                                  size: 20,
                                                ),
                                                Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Tcolor.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 55,
                                  left: 285,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Tcolor.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Tcolor.secondary)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      color: Tcolor.main,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
