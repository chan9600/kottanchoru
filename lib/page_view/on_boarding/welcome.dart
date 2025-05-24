import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/page_view/auth/login_page.dart';
import 'package:kottanchoru/page_view/on_boarding/on_boarding_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                  height: 330,
                  width: size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Tcolor.secondary)
                      ],
                      color: Tcolor.main,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 245,
                  left: size.width / 2 - 85,
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 85,
                  child: SizedBox(
                    height: size.width * 0.55,
                    width: size.width * 0.55,
                    child: Image.asset(
                      'assets/images/logo2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )),
            Text(
              'Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep',
              style: TextStyle(
                  fontSize: size.width * 0.038, color: Tcolor.secondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            RoundButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                title: 'Login'),
            SizedBox(height: size.width * 0.06),
            RoundButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnBoardingScreen()));
              },
              title: 'Create an Account',
              type: RoundButtonType.textPrimary,
            ),
            const SizedBox(height: 60),
          ],
        ));
  }
}
