// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common/snack.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/common_widget/text_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/auth/common/auth.dart';
import 'package:kottanchoru/page_view/auth/login_page.dart';
import 'package:kottanchoru/page_view/on_boarding/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();
  var registrationKey = GlobalKey<FormState>();

  Position? position;
  List<Placemark>? placeMarks;
  bool isLoading = false;
  bool isValid = false;
  final Auth _authService = Auth();

  void signUp() async {
    setState(() {
      isValid = true;
    });
    final result = await _authService.signUpUser(
        email: emailController.text, password: passwordController.text);
    if (result == "Success") {
      setState(() {
        isValid = false;
      });
      snack(context, "Signup Successfully");
      Future.delayed(
          const Duration(milliseconds: 2000),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen())));
    } else {
      setState(() {
        isValid = false;
      });
      snack(context, "This email is already registered");
    }
  }

  Future<void> getCurrentLocation() async {
    setState(() {
      isLoading = true;
    });

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever ||
            permission == LocationPermission.denied) {
          setState(() {
            isLoading = false;
          });
          return;
        }
      }
      getLoc();
    }
    if (serviceEnabled == true) {
      getLoc();
    }
  }

  void getLoc() async {
    await Geolocator.getCurrentPosition().then((value) => setState(() {
          position = value;
        }));
    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placeMarks![0];
    setState(() {
      isLoading = false;
    });
    String completeAddress =
        '${pMark.street},${pMark.thoroughfare},${pMark.locality},${pMark.administrativeArea},${pMark.country},${pMark.postalCode}';
    addressController.text = completeAddress;
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
                    'Sign Up',
                    style: TextStyle(
                        color: Tcolor.primary,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Add your details to sign up',
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
                  key: registrationKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (nameController.text.isEmpty) {
                            return 'Please Enter Your  Name';
                          }
                          return null;
                        },
                        controller: nameController,
                        data: Icons.person,
                        hintText: 'Name',
                        type: KeyBoardType.text,
                        enabled: true,
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        validate: (email) {
                          return !EmailValidator.validate(email)
                              ? 'Please Enter Valid Email'
                              : null;
                        },
                        controller: emailController,
                        data: Icons.email,
                        hintText: 'Email',
                        enabled: true,
                        type: KeyBoardType.text,
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (mobileController.text.isEmpty) {
                            return 'Please Enter Your Mobile.';
                          } else {
                            return null;
                          }
                        },
                        error: 'Please Enter Your Mobile No',
                        controller: mobileController,
                        data: Icons.phone,
                        type: KeyBoardType.number,
                        hintText: 'Mobile No',
                        enabled: true,
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus!.unfocus(),
                          validator: (addressController) {
                            if (addressController!.isEmpty) {
                              return 'Please Select Your  Address';
                            }
                            return null;
                          },
                          cursorColor: Tcolor.secondary,
                          autocorrect: false,
                          controller: addressController,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              errorStyle: TextStyle(color: Tcolor.main),
                              fillColor: Tcolor.textBox,
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: IconButton(
                                    onPressed: () {
                                      getCurrentLocation();
                                    },
                                    icon: isLoading
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Tcolor.main,
                                            ),
                                          )
                                        : Icon(
                                            Icons.location_on,
                                            color: Tcolor.main,
                                          )),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide:
                                      BorderSide(color: Tcolor.textBox)),
                              hintText: 'Get current address',
                              hintStyle: TextStyle(
                                  color: Tcolor.placeholder,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        validate: (controller) {
                          if (passwordController.text.isEmpty) {
                            return 'Please Enter Your Password';
                          } else if (passwordController.text.length < 6) {
                            return 'Password must be at least 6 character';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        error: 'Please Enter Your Password',
                        data: Icons.password,
                        hintText: 'Password',
                        type: KeyBoardType.text,
                        enabled: true,
                        isObsecure: true,
                        pass: Special.off,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                        error: 'Please Enter Your Confirm Password',
                        controller: confirmController,
                        data: Icons.password,
                        hintText: 'Confirm Password',
                        enabled: true,
                        type: KeyBoardType.text,
                        isObsecure: true,
                        pass: Special.off,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                isValid
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Tcolor.main,
                        ),
                      )
                    : RoundButton(
                        onPressed: () {
                          if (registrationKey.currentState!.validate()) {
                            signUp();
                            saveData();
                          }
                        },
                        title: 'Sign Up'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
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
                                  builder: (context) => const LoginPage()));
                        },
                        title: 'Login?'),
                  ],
                ),
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
