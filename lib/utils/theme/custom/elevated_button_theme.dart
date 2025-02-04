import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_five/utils/constants/colors.dart';

class MyElevatedButtonTheme {
  MyElevatedButtonTheme._();

  static final myElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      foregroundColor: MyColors.blueDark7,
      backgroundColor: MyColors.yellow5,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xfffcf3cf)),
      padding: const EdgeInsets.symmetric(vertical: 14),
      textStyle: GoogleFonts.aDLaMDisplay(
        fontSize: 20,
        color: Colors.white, 
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)
    )
  );

}
