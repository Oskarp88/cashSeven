import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class MyTextStyle {

  static final headlineLarge = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font32,
      fontWeight: FontWeight.bold,
      color: MyColors.wesAsphalt0
    );

  static final  headlineMedium = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font24,
      fontWeight: FontWeight.w600,
      color: MyColors.wesAsphalt0
    );

  static final headlineSmall = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font18,
      fontWeight: FontWeight.w600,
      color: MyColors.wesAsphalt0
    );

    static final titleLarge = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font16,
      fontWeight: FontWeight.w600,
      color: MyColors.wesAsphalt0
    );

    static final titleMedium = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font16,
      fontWeight: FontWeight.w500,
      color: MyColors.wesAsphalt0
    );

    static final titleSmall = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font14,
      fontWeight: FontWeight.w500,
      color: MyColors.wesAsphalt0
    );

    static final bodyLarge = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font14,
      fontWeight: FontWeight.w500,
      color: MyColors.wesAsphalt0
    );
    
    static final bodyMedium = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font14,
      fontWeight: FontWeight.normal,
      color: MyColors.wesAsphalt0
    );

    static final bodySmall = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font14,
      fontWeight: FontWeight.w500,
      color: MyColors.wesAsphalt0.withOpacity(0.5)
    );

    static final labelLarge = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font12,
      fontWeight: FontWeight.normal,
      color: MyColors.wesAsphalt0
    );
    static final labelMedium = GoogleFonts.aDLaMDisplay(
      fontSize: Dimensions.font12,
      fontWeight: FontWeight.w600,
      color: MyColors.wesAsphalt0.withOpacity(0.5)
    );
}