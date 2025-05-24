import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/tap_button.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/more.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/offers.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/profile.dart';
import 'package:kottanchoru/page_view/maintap_bar/Menu/menu_page.dart';
import 'package:kottanchoru/page_view/maintap_bar/home/home_page.dart';

class MainTapBar extends StatefulWidget {
  const MainTapBar({super.key});

  @override
  State<MainTapBar> createState() => _MainTapBarState();
}

class _MainTapBarState extends State<MainTapBar> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView =  const HomePage();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? Tcolor.main : Tcolor.placeholder,
          onPressed: () {
            if (selectTab != 2) {
              selectTab = 2;
              selectPageView =  const HomePage();
            }
            if (mounted) {
              setState(() {});
            }
          },
          child: Image.asset(
            'assets/images/home_icon.png',
            width: size.width * 0.4,
            height: size.width * 0.14,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.width * 0.25,
        color: Tcolor.white,
        surfaceTintColor: Tcolor.white,
        shadowColor: Tcolor.white,
        elevation: 20,
        notchMargin: size.width * 0.046,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            TapButton(
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = MenuPage();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: 'Menu',
                icon: "assets/images/menu_icon.png",
                isSelected: selectTab == 0),
            const SizedBox(
              width: 30,
            ),
            TapButton(
                onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPageView = const OffersItem();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: 'Offers',
                icon: "assets/images/offer_icon.png",
                isSelected: selectTab == 1),
            const SizedBox(width: 130),
            TapButton(
                onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPageView = const ProfilePage();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: 'Profile',
                icon: "assets/images/profile_icon.png",
                isSelected: selectTab == 4),
            const SizedBox(
              width: 30,
            ),
            TapButton(
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView = const More();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: 'More',
                icon: "assets/images/more_icon.png",
                isSelected: selectTab == 3),
          ],
        ),
      ),
    );
  }
}
