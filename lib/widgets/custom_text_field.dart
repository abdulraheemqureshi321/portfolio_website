import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

import '../styles/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
     this.maxLines = 1,
     this.hintText
  });

  final TextEditingController? controller;
  final int? maxLines ;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,

      style: TextStyle(color: CustomColor.scaffoldBg, ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColor.whiteSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: hintText,
        hintStyle: TextStyle(color: CustomColor.hintDark),

      ),
    );
  }
}
