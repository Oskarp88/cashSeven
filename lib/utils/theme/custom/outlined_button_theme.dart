import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/colors.dart';


class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  static final myOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: const Color(0xfff9e79f),
      side: const BorderSide(color: Color(0xfff4d03f), width: 2),
      textStyle: const TextStyle(
        color: MyColors.wesAsphalt0,
        fontSize: 20,
        fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal:20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
    )
  );
}
