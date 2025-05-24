import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common/model.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/common/category_items.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/common/most_popular_items.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/common/popular_item.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/common/recent_items.dart';
import 'package:kottanchoru/common_widget/text_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greeting = "";
  TextEditingController textSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateGreeting();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      updateGreeting();
    });
  }

  void updateGreeting() {
    setState(() {
      greeting = getGreeting();
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18 || hour == 12) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  List countryFood = [
    {"image": "assets/images/pop2.jpg", "name": "Offers"},
    {"image": "assets/images/pop2.jpg", "name": "Sri Lanka"},
    {"image": "assets/images/pop2.jpg", "name": "Italian"},
    {"image": "assets/images/pop2.jpg", "name": "Indian"},
  ];

  List popRes = [
    {
      "image": "assets/images/pop4.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop3.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop2.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
  ];

  List mostPop = [
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "124",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "124",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "124",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "124",
      "type": "Food",
      "food_type": "western Food"
    },
  ];

  List recItems = [
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
      "food_type": "western Food"
    },
    {
      "image": "assets/images/pop1.jpg",
      "name": "Offers",
      "rate": "4.9",
      "rating": "(124 rating)",
      "type": "Food",
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
                '$greeting Chan!',
                style: TextStyle(
                    fontSize: 18,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 10),
                child: Text(
                  'Delivering to',
                  style: TextStyle(
                      fontSize: 15,
                      color: Tcolor.secondary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Text(
                      'Current Location',
                      style: TextStyle(
                          fontSize: 18,
                          color: Tcolor.primary,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 25,
                        color: Tcolor.main,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormFieldWidget(
                validate: (controller) {
                  return null;
                },
                controller: textSearch,
                data: Icons.search,
                hintText: 'Search Food',
                isObsecure: false,
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Model.country.length,
                      itemBuilder: ((context, index) {
                        var object2 = Model.country[index] as Map? ?? {};
                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: CategoryItems(
                              onTap: () {},
                              object2: object2,
                            ));
                      }),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Popular Restaurants",
                          style: TextStyle(
                              fontSize: 18,
                              color: Tcolor.primary,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      TextButtonWidget(onPressed: () {}, title: 'View All')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: Model.Res.length,
                      itemBuilder: ((context, index) {
                        var object = Model.Res[index] as Map? ?? {};
                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: PopularItem(
                              onTap: () {},
                              object2: object,
                            ));
                      }),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Most Popular",
                          style: TextStyle(
                              fontSize: 18,
                              color: Tcolor.primary,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      TextButtonWidget(onPressed: () {}, title: 'View All')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Model.popular.length,
                      itemBuilder: ((context, index) {
                        var object = Model.popular[index] as Map? ?? {};
                        return Container(
                            margin: EdgeInsets.only(left: size.width * 0.02),
                            child: MostPopularItems(
                                object2: object, onTap: () {}));
                      }),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Recent Items",
                          style: TextStyle(
                              fontSize: 18,
                              color: Tcolor.primary,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      TextButtonWidget(onPressed: () {}, title: 'View All')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: countryFood.length,
                      itemBuilder: ((context, index) {
                        var object3 = recItems[index] as Map? ?? {};
                        return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.width * 0.02),
                            child: RecentItems(object: object3, onTap: () {}));
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
