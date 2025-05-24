import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/page_view/maintap_bar/maintap_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int selectPage = 0;
  List pageList = [
    {
      "title": "Find Food Love",
      "subTitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/images/find_food.png",
    },
    {
      "title": "Fast Delivery",
      "subTitle": "Fast food delivery to your home, office\n wherever you are",
      "image": "assets/images/food_delivery.png",
    },
    {
      "title": "Live Tracking",
      "subTitle":
          "Real time tracking of your food on the app\nonce you place the order",
      "image": "assets/images/live_tracking.png",
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                var pageObject = pageList[index] as Map? ?? {};
                return Column(
                  children: [
                    SizedBox(
                      height: w * 0.2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        pageObject["image"].toString(),
                        width: w * 0.7,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: w * 0.3),
                    Text(pageObject['title'].toString(),
                        style: TextStyle(
                            fontSize: w * 0.08,
                            color: Tcolor.primary,
                            fontWeight: FontWeight.w800)),
                    SizedBox(height: w * 0.07),
                    Text(pageObject['subTitle'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: w * 0.033,
                            color: Tcolor.secondary,
                            fontWeight: FontWeight.w500)),
                  ],
                );
              }),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageList.map((e) {
                var index = pageList.indexOf(e);
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: index == selectPage
                          ? Tcolor.main
                          : Tcolor.placeholder,
                      borderRadius: BorderRadius.circular(4)),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: w * 1.4),
            child: RoundButton(
              title: 'Next',
              onPressed: () {
                if (selectPage >= 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTapBar()));
                } else {
                  selectPage = selectPage + 1;
                  controller.animateToPage(selectPage,
                      duration: (const Duration(milliseconds: 300)),
                      curve: Curves.linear);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
