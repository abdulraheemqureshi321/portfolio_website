import 'package:flutter/material.dart';

import '../constants/colors.dart';

BoxDecoration kHeaderDecoration = BoxDecoration(
  gradient: const LinearGradient(colors: [Colors.transparent, CustomColor.bgLight1,]),
  borderRadius: BorderRadius.circular(100),
);

OutlineInputBorder get getInputBorder{
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none
  );
}