import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/theme/custom/checkbox_theme.dart';
import 'package:survey_five/utils/theme/custom/elevated_button_theme.dart';
import 'package:survey_five/utils/theme/custom/outlined_button_theme.dart';
import 'package:survey_five/utils/theme/custom/text_field_theme.dart';

class MyAppTheme{
  MyAppTheme._();

  static ThemeData myTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: MyColors.blueDark7,
    inputDecorationTheme: MyTextFieldTheme.myInputDecorationTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.myElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.myOutlinedButtonTheme,
    checkboxTheme: MyCheckboxTheme.myCheckboxTheme
  );
}