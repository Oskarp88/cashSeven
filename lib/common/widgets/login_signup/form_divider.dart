import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';

class FormDivider extends StatelessWidget {
  final String dividetText;
  const FormDivider({super.key, required this.dividetText});

 

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividetText,
          style: MyTextStyle.labelMedium,
        ),
        const Flexible(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
