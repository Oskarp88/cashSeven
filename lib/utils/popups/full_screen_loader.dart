import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/common/widgets/loaders/animation_loaders.dart';
import 'package:survey_five/utils/constants/colors.dart';


class OFullScreenLoader {
  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, 
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: MyColors.blueDark5,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          ),
        )
      )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}