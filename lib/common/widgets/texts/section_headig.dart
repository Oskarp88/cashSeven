import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';

class SectionHeading extends StatelessWidget {
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  
  const SectionHeading({
    super.key, 
    this.textColor, 
    this.showActionButton = true, 
    required this.title, 
    this.buttonTitle = 'View all', 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
           title, 
           style: MyTextStyle.headlineSmall.apply(color: textColor),
           maxLines: 1,
           overflow: TextOverflow.ellipsis,
         ),
        if (showActionButton) TextButton(
            onPressed: onPressed,
            child:  Text(buttonTitle) 
            ) ,
      ],
    );
  }
}

