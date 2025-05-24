import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common/snack.dart';
import 'package:kottanchoru/common_widget/elevated_button.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/common_widget/text_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/auth/common/auth.dart';
import 'package:kottanchoru/page_view/auth/registration_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:kottanchoru/page_view/maintap_bar/maintap_bar.dart';
import 'package:kottanchoru/page_view/on_boarding/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final passWord = TextEditingController();
  bool isValid = false;
  bool isGoogle = false;
  final Auth _authService = Auth();

  void login() async {
    setState(() {
      isValid = true;
    });
    final result = await _authService.loginUser(
        email: email.text, password: passWord.text);
    if (result == "Success") {
      setState(() {
        isValid = false;
      });
      snack(context, "Login Successfully");
      Future.delayed(
          const Duration(milliseconds: 2000),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen())));
    } else {
      setState(() {
        isValid = false;
        passWord.clear();
      });
      snack(context, "Check email and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Tcolor.primary,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Add your details to login',
                    style: TextStyle(
                        color: Tcolor.secondary,
                        fontSize: size.width * 0.038,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: loginKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        validate: (email) {
                          return !EmailValidator.validate(email)
                              ? 'Please Enter Valid Email'
                              : null;
                        },
                        controller: email,
                        data: Icons.email,
                        hintText: 'Your Email',
                        enabled: true,
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (passWord.text.isEmpty) {
                            return 'Please Enter Your Password';
                          } else {
                            return null;
                          }
                        },
                        controller: passWord,
                        data: Icons.password,
                        hintText: 'Password',
                        enabled: true,
                        isObsecure: true,
                        pass: Special.off,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                isValid
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Tcolor.main,
                        ),
                      )
                    : RoundButton(
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            //FocusScope.of(context).unfocus();
                            login();
                            saveData();
                          }
                        },
                        title: 'Login'),
                const SizedBox(height: 10),
                TextButtonWidget(
                    onPressed: () {}, title: 'Forgot your password?'),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'or Login with',
                    style: TextStyle(
                        color: Tcolor.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.width * 0.05),
                ElevatedButtonWidget(
                  image: 'assets/images/facebook.png',
                  onPressed: () async {},
                  title: 'Login with Facebook',
                ),
                SizedBox(height: size.width * 0.06),
                isGoogle
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Tcolor.main,
                        ),
                      )
                    : ElevatedButtonWidget(
                        image: 'assets/images/google.png',
                        type: ElevatedButtonType.textPrimary,
                        onPressed: () async {
                          setState(() {
                            isGoogle = true;
                            return;
                          });
                          bool isLogged = await _authService.google();

                          if (isLogged) {
                            Future.delayed(
                                const Duration(milliseconds: 2000),
                                () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainTapBar())));
                            setState(() {
                              isGoogle = false;
                              return;
                            });
                          }
                          setState(() {
                            isLogged = false;
                          });
                          saveData();
                        },
                        title: 'Login with Google',
                      ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(
                          color: Tcolor.secondary,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      title: 'Sign Up?',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveData() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool("newUser", false);
  }
}
