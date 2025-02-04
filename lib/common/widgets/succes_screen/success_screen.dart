import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/common/styles/spacing_styles.dart';
import 'package:survey_five/utils/constants/dimensions.dart';


class SuccessScreen extends StatelessWidget {
  final String image, title, sutTitle;
  final VoidCallback onPressed;
  const SuccessScreen({super.key,
    required this.image,
    required this.sutTitle,
    required this.title,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight * 3,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: Dimensions.screenWidth*0.6,
              ),
              SizedBox(height: Dimensions.spaceBtwSections,),
              Text(
                 title, 
                 style: MyTextStyle.headlineMedium,
                 textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.spaceBtwItems,),
                Text(
                  sutTitle,
                  style: MyTextStyle.labelMedium,
                  textAlign: TextAlign.center,
                ),
               SizedBox(height:Dimensions.spaceBtwSections,),

                ///button
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed, 
                  child: const Text('Continue')
                ),
               ),

            ],
          ),
        ),
      ),
    );
  }
}