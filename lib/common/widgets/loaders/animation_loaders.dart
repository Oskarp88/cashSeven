import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class OAnimationLoaderWidget extends StatelessWidget {
  const OAnimationLoaderWidget({
    super.key, 
    required this.text, 
    required this.animation, 
    this.showAction = false, 
    this.actionText, 
    this.onActionPressed
  });
  
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          animation, 
          width: MediaQuery.of(context).size.width * 0.4
        ),
        SizedBox(height: Dimensions.defaultSpace,),
        showAction 
          ? SizedBox(
            height: (Dimensions.height100),
            child: OutlinedButton(
              onPressed: onActionPressed, 
              child: Text(
                actionText!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              )
            ),
          )
          :  Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
      ],
     ),
   );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}