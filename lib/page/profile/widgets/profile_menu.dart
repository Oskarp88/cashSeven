
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, 
    this.icon = Iconsax.arrow_right_34, 
    required this.onPressed, 
    required this.title, 
    required this.value,
  });
  
  final IconData icon;
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
              flex: 3,
              child: Text(
                title, 
                style:  const TextStyle(
                  color: MyColors.blueDark9,
                  fontWeight: FontWeight.w900
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value, 
                style: const TextStyle(
                  color: MyColors.greebAccentDark9,
                  fontWeight: FontWeight.w700
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: 18, color: MyColors.greenDark9,))
          ],
        ),
      ),
    );
  }
}