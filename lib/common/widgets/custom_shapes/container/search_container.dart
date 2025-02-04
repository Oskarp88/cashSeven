import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/device/device_utility.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  const SearchContainer({
    super.key, 
    required this.text, 
    this.icon = Iconsax.search_normal, 
    this.showBackground = true, 
    this.showBorder= true, 
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtility.getScreenWidth(context),
          padding: EdgeInsets.all(Dimensions.height15),
          decoration: BoxDecoration(
            color: showBackground ? Colors.lightBlue : Colors.transparent, 
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            border: showBorder ? Border.all(color: Colors.grey,) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              SizedBox(width: Dimensions.spaceBtwItems),
              Text(
                 text,
                 style: Theme.of(context).textTheme.bodySmall, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}

