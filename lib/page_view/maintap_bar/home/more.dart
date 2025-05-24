import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}
class _MoreState extends State<More> {
  TextEditingController textSearch = TextEditingController();
  List MoreList = [
    {
      "name": "Payment Details",
      "image": "assets/images/payment.png",
    },
    {
      "name": "My Orders",
      "image": "assets/images/my_order.png",
      "items_count": "220 Items",
    },
    {
      "name": "Notification",
      "image": "assets/images/notification.png",
      "items_count": "155 Items",
    },
    {
      "name": "Inbox",
      "image": "assets/images/inbox.png",
      "items_count": "25 Items",
    },
    {
      "name": "About Us",
      "image": "assets/images/about.png",
      "items_count": "25 Items",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Expanded(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: size.width * 0.1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.07, right: size.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More',
                          style: TextStyle(
                              fontSize: size.width * 0.046,
                              color: Tcolor.primary,
                              fontWeight: FontWeight.w800),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            size: size.width * 0.07,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.00,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.width * 0.001),
                        child: SizedBox(
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: ListView.builder(
                              itemCount: MoreList.length,
                              itemBuilder: ((context, index) {
                                var object = MoreList[index] as Map? ?? {};
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.08),
                                            child: Container(
                                              width: size.width * 0.84,
                                              height: size.width * 0.20,
                                              decoration: BoxDecoration(
                                                  color: Tcolor.textBox,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15)),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 4),
                                                    )
                                                  ]),
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipOval(
                                                child: Container(
                                                  color: Tcolor.placeholder,
                                                  child: Image.asset(
                                                    object["image"],
                                                    color: Tcolor.primary,
                                                    scale: 28,
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.07),
                                              Text(object["name"].toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Tcolor.primary,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 25,
                                          left: 320,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Tcolor.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 10,
                                                      color: Tcolor.placeholder)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 18,
                                                color: Tcolor.primary),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
