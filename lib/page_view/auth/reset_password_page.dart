import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';
import 'package:kottanchoru/common_widget/error_dialogue.dart';
import 'package:kottanchoru/common_widget/round_button.dart';
import 'package:kottanchoru/common_widget/text_form_field.dart';
import 'package:kottanchoru/page_view/auth/new_password_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // void validation() {
  //   if (emailController.text.isEmpty) {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const ErrorDialogue(
  //               message: 'Please enter your email', title: 'Missing!!');
  //         });
  //   } else {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const NewPasswordPage()));
  //   }
  // }

  TextEditingController emailController = TextEditingController();
  var resetKey = GlobalKey<FormState>();
  bool? isValid;
  @override
  Widget build(BuildContext context) {
    void validate(String email) {
      isValid = EmailValidator.validate(email);
    }

    Future showAlertDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialogue(
              message: 'please enter valid email formate',
              title: 'Re correct!',
            );
          });
    }

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
          child: Column(
            children: [
              Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Tcolor.primary,
                      fontSize: h * 0.037,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.012),
                child: Text(
                  'Please enter your email to receive a link to create a new password via email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Tcolor.secondary,
                      fontSize: h * 0.015,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: resetKey,
                child: TextFormFieldWidget(
                  validate: (email) {
                    return !EmailValidator.validate(email)
                        ? 'Please Enter Valid Email'
                        : null;
                  },
                  error: 'Please Enter Your Email',
                  controller: emailController,
                  data: Icons.email,
                  hintText: 'Your Email',
                  enabled: true,
                  isObsecure: false,
                ),
              ),
              const SizedBox(height: 28),
              RoundButton(
                  onPressed: () {
                    if (resetKey.currentState!.validate()) {
                      validate(emailController.text);
                      if (isValid == false) {
                        showAlertDialog();
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewPasswordPage()));
                      }
                    }
                  },
                  title: 'Send'),
            ],
          ),
        ),
      ),
    );
  }
}
