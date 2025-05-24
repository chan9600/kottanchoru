import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/auth/common/auth.dart';
import 'package:kottanchoru/page_view/auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();
  var registrationKey = GlobalKey<FormState>();
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
                'Profile',
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
        body: SingleChildScrollView(
          child: Form(
            key: registrationKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            fixedSize: const Size(140, 15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Tcolor.main,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              "Edit Profile",
                              style:
                                  TextStyle(color: Tcolor.main, fontSize: 15),
                            )
                          ],
                        )),
                    Text(
                      'Hai there Chan!',
                      style: TextStyle(
                          fontSize: size.width * 0.046,
                          color: Tcolor.primary,
                          fontWeight: FontWeight.w800),
                    ),
                    TextButton(
                        onPressed: () {
                          Auth().signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: TextButton.styleFrom(
                            fixedSize: const Size(130, 10)),
                        child: Text(
                          "Signout",
                          style:
                              TextStyle(color: Tcolor.secondary, fontSize: 15),
                        )),
                    TextFormFieldWidget(
                      validate: (controller) {
                        if (nameController.text.isEmpty) {
                          return 'Please Enter Your Name';
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      data: Icons.person,
                      hintText: 'Name',
                      enabled: true,
                      isObsecure: false,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
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
                      isObsecure: false,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    TextFormFieldWidget(
                      validate: (controller) {
                        if (mobileController.text.isEmpty) {
                          return 'Please Enter Your Mobile No.';
                        } else {
                          return null;
                        }
                      },
                      controller: mobileController,
                      data: Icons.phone,
                      hintText: 'Mobile No',
                      enabled: true,
                      isObsecure: false,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    TextFormFieldWidget(
                      validate: (controller) {
                        if (addressController.text.isEmpty) {
                          return 'Please Enter Your Password';
                        } else {
                          return null;
                        }
                      },
                      controller: addressController,
                      data: Icons.home_work_rounded,
                      hintText: 'Address',
                      enabled: true,
                      isObsecure: false,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    TextFormFieldWidget(
                      validate: (controller) {
                        if (passwordController.text.isEmpty) {
                          return 'Please Enter Your Password';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      error: 'Please Enter Your Password',
                      data: Icons.password,
                      hintText: 'Password',
                      enabled: true,
                      isObsecure: true,
                      pass: Special.off,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
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
                      isObsecure: true,
                      pass: Special.off,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    RoundButton(
                        onPressed: () {
                          if (registrationKey.currentState!.validate()) {}
                        },
                        title: "Save"),
                    SizedBox(
                      height: size.width * 0.15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
