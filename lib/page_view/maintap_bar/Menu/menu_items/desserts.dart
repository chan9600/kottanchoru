import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/common/item_details.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/common/menu_items_list.dart';
import 'package:kottanchoru/common_widget/provider.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/maintap_bar/maintap_bar.dart';
import 'package:provider/provider.dart';

class DessertsItems extends StatelessWidget {
  DessertsItems({super.key});
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
    return Consumer<NumbersListProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainTapBar()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Tcolor.primary,
              size: 25,
            ),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Desserts',
                style: TextStyle(
                    fontSize: 25,
                    color: Tcolor.primary,
                    fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Tcolor.primary,
                  size: 28,
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              validate: (controller) {
                return null;
              },
              controller: textSearch,
              data: Icons.search,
              hintText: 'Search Desserts',
              isObsecure: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: popRes.length,
                itemBuilder: ((context, index) {
                  var object2 = popRes[index] as Map? ?? {};
                  return MenuItemsList(
                      object: object2,
                      onTap: () {
                        var obj = value.item[index] as Map? ?? {};
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetails(
                                      image: obj['image'],
                                      title: obj['title'],
                                      rate: obj['rate'],
                                      description: obj['description'],
                                    )));
                      });
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
