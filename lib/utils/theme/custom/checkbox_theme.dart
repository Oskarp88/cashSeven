import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/colors.dart';

class MyCheckboxTheme {
  MyCheckboxTheme._();

  static CheckboxThemeData myCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),   

    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.blueDark9;
      } else {
        return Colors.black;
      }
    }),
    side: const BorderSide(color: MyColors.wesAsphalt0),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.blueLight3;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
