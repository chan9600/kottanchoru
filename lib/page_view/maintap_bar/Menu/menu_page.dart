import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common/model.dart';
import 'package:kottanchoru/common_widget/food_list.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/menu_items/beverages.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/menu_items/food.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/menu_items/promotions.dart';

class MenuPage extends StatelessWidget {
  TextEditingController textSearch = TextEditingController();
  List menuItem = [
    FoodItems(),
    BeveragesItems(),
    FoodList(itemList: Model.coldDrinks, title: 'Cold Drinks'),
    PromotionsItems()
  ];
  List menuList = [
    {
      "name": "Menu",
      "image": "assets/images/pop2.jpg",
      "items_count": "120 Items",
    },
    {
      "name": "Beverages",
      "image": "assets/images/pop2.jpg",
      "items_count": "220 Items",
    },
    {
      "name": "Desserts",
      "image": "assets/images/pop2.jpg",
      "items_count": "155 Items",
    },
    {
      "name": "Promotions",
      "image": "assets/images/pop2.jpg",
      "items_count": "25 Items",
    },
  ];

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                  fontSize: 20,
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
          TextFormFieldWidget(
            validate: (controller) {
              return null;
            },
            controller: textSearch,
            data: Icons.search,
            hintText: 'Search Menu',
            isObsecure: false,
          ),
          const SizedBox(
            height: 25,
          ),
          Stack(
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: Tcolor.main,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                height: 470,
                width: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: SizedBox(
                  height: 480,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      itemCount: Model.menu.length,
                      itemBuilder: ((context, index) {
                        var object = Model.menu[index] as Map? ?? {};
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => menuItem[index]));
                            },
                            child: Stack(
                              children: [
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      width: 280,
                                      height: 80,
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
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 33,
                                        backgroundImage: AssetImage(
                                          object["image"].toString(),
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(object["name"].toString(),
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Tcolor.primary,
                                              )),
                                          Text(object["items_count"].toString(),
                                              style: TextStyle(
                                                  color: Tcolor.secondary)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 25,
                                  left: 280,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Tcolor.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Tcolor.placeholder)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(Icons.arrow_forward_ios_rounded,
                                        color: Tcolor.main),
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
          )
        ],
      ),
    );
  }
}
