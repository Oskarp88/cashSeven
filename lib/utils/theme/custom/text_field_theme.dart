import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/colors.dart';

class MyTextFieldTheme {
  MyTextFieldTheme._();

  static InputDecorationTheme myInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.wesAsphalt0,
    suffixIconColor: MyColors.wesAsphalt0,
    //constraints: const BoxConstraints.expand(height: 14, inputFieldHeight),
     labelStyle: const TextStyle().copyWith(fontSize: 14, color: MyColors.wesAsphalt0),
     hintStyle: const TextStyle().copyWith(fontSize: 14, color: MyColors.wesAsphalt0),
     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
     floatingLabelStyle: const TextStyle().copyWith(color: const Color(0xffd6eaf8).withOpacity(0.8)),
     border: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(30),
       borderSide: const BorderSide(width: 2, color:MyColors.wesAsphalt0)
     ),
     enabledBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(30),
       borderSide: const BorderSide(width: 2, color: MyColors.wesAsphalt0)
     ),
     focusedBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(30),
       borderSide: const BorderSide(width: 2, color: Color(0xffd6eaf8)),
     ),
     errorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(30),
       borderSide: const BorderSide(width: 2, color: Colors.red)
     ),
     focusedErrorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(30),
       borderSide: const BorderSide(width: 2, color: Colors.orange)
     ),
  );
}
