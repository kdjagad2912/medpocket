// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medpocket/src/components/styles/CustomTextStyle.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color baseColor;
  final Color borderColor;
  final Color errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onChanged;

  const CustomTextField(
      {super.key,
      this.hint = "",
      required this.controller,
      required this.onChanged,
      required this.baseColor,
      required this.borderColor,
      required this.errorColor,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      required this.validator});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      elevation: 30.0,
      shadowColor: Colors.primaries.last,
      child: TextField(
        obscureText: widget.obscureText,
        // onChanged: (text) {
        //   // widget.onChanged(text);
        //   setState(() {
        //     if (!widget.validator(text) || text.isEmpty) {
        //       currentColor = widget.errorColor;
        //     } else {
        //       currentColor = widget.baseColor;
        //     }
        //   });
        // },
        keyboardType: widget.inputType,
        controller: widget.controller,
        decoration: InputDecoration(
            hintStyle: inputPlaceHolder(context),
            border: InputBorder.none,
            hintText: widget.hint,
            contentPadding: const EdgeInsets.all(15.0)),
      ),
    );
  }
}
