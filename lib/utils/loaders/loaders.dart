import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class Loaders {
  static hideSnackbar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:MyColors.blackRow.withOpacity(0.8),
          ),
          child: Center(
            child: Text(
              message,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        )
      )
    );
  }
  
  static warningSnackBar({required title, message = ''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: MyColors.white1,
      backgroundColor: Colors.orange.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.all(Dimensions.height20),
      icon: const Icon(Iconsax.warning_2, color: Colors.white,)
    );
  }

  static successSnackBar({required title, message = ''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: MyColors.white1,
      backgroundColor: Colors.green.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.all(Dimensions.height20),
      icon: const Icon(Iconsax.copy_success, color: Colors.white,)
    );
  }

  static errorSnackBar({required title, message = ''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: MyColors.white1,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.all(Dimensions.height20),
      icon: const Icon(Iconsax.warning_2, color: Colors.white,)
    );
  }
}