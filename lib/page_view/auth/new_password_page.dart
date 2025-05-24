import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/on_boarding/on_boarding_screen.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});
  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();
  var newPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: IconThemeData(color: Tcolor.main),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'New Password',
                    style: TextStyle(
                        color: Tcolor.primary,
                        fontSize: h * 0.037,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter your email to receive a link to create a new password via email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Tcolor.secondary,
                      fontSize: h * 0.015,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 25),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: newPasswordKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (passwordController.text.isEmpty) {
                            return 'Please Enter Your Password';
                          } else if (passwordController.text.length < 6) {
                            return "Password must be at least 6 character";
                          } else {
                            return null;
                          }
                        },
                        error: 'Please Enter Password',
                        controller: passwordController,
                        data: Icons.password,
                        hintText: 'New Password',
                        enabled: true,
                        isObsecure: true,
                        pass: Special.off,
                      ),
                      const SizedBox(height: 25),
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (confirmController.text.isEmpty) {
                            return 'Please Enter Your confirm Password';
                          } else if (passwordController.text !=
                              confirmController.text) {
                            return 'Password & confirm Password should be same';
                          } else {
                            return null;
                          }
                        },
                        error: 'Please Enter Confirm Password',
                        controller: confirmController,
                        data: Icons.password,
                        hintText: 'Confirm Password',
                        enabled: true,
                        isObsecure: true,
                        pass: Special.off,
                      ),
                      const SizedBox(height: 28),
                      RoundButton(
                          onPressed: () {
                            if (newPasswordKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoardingScreen()));
                            }
                          },
                          title: 'Next'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
