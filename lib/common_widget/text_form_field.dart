// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kottanchoru/common/color.dart';

enum Special { on, off }

enum KeyBoardType { number, text }

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  bool? isObsecure = true;
  bool? enabled = true;
  final String? error;
  final Special pass;
  final KeyBoardType type;
  final FormFieldValidator validate;

  TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validate,
    this.error,
    required this.data,
    required this.hintText,
    this.isObsecure,
    this.enabled,
    this.pass = Special.on,
    this.type = KeyBoardType.text,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
          validator: widget.validate,
          cursorColor: Tcolor.secondary,
          autocorrect: false,
          keyboardType: widget.type == KeyBoardType.text
              ? null
              : const TextInputType.numberWithOptions(),
          controller: widget.controller,
          obscuringCharacter: '*',
          obscureText: widget.pass == Special.on ? widget.isObsecure! : hidden,
          enabled: widget.enabled,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Tcolor.main),
            fillColor: Tcolor.textBox,
            filled: true,
            prefixIcon: Icon(
              widget.data,
              color: Tcolor.placeholder,
              size: h * 0.037,
            ),
            // suffix: widget.pass == PasswordType.passWordHidden
            //     ? null
            //     : IconButton(
            //         style: IconButton.styleFrom(
            //           fixedSize: const Size(10, 10),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             hidden = !hidden;
            //           });
            //         },
            //         icon: hidden
            //             ? Icon(
            //                 Icons.visibility_off,
            //                 color: Tcolor.placeholder,
            //               )
            //             : Icon(
            //                 Icons.visibility,
            //                 color: Tcolor.placeholder,
            //               )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Tcolor.textBox)),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: Tcolor.placeholder,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          ),
        ),
      ),
    );
  }
}
