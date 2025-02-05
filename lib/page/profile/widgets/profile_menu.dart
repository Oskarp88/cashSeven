
import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, 
    required this.onPressed, 
    required this.title, 
    required this.value,
  });
  
  final VoidCallback onPressed;
  final String title, value;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.spaceBtwItems / 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title, 
                style: MyTextStyle.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                value, 
                style: MyTextStyle.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}