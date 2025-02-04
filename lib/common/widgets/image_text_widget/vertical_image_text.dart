import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class VerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  
  const VerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = Colors.white, 
    this.backgroundColor = Colors.white, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: Dimensions.spaceBtwItems),
        child: Column(
          children: [
             ///Circular Icon
             Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
             ),
             ///text
             SizedBox(height: Dimensions.spaceBtwItems / 2), 
             SizedBox(
              width: 55,
               child: Text(
                 title,
                 style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
               ),
             )
          ],
        ),
      ),
    );
  }
}

