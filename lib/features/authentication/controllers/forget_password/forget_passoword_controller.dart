import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:survey_five/utils/connects/network_manager.dart';
import 'package:survey_five/utils/constants/string_image.dart';
import 'package:survey_five/utils/loaders/loaders.dart';
import 'package:survey_five/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try {
     
      OFullScreenLoader.openLoadingDialog('Processing your request...', MyImage.loadingImage);
     
      final isConnected = await NetworkManager.instance.isConnected();
     
      if(!isConnected){
        OFullScreenLoader.stopLoading();
        return;
      }

      if(!forgetPasswordFormKey.currentState!.validate()){
        OFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      
      OFullScreenLoader.stopLoading();
      
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your passaword'.tr);
    
      Get.to(() => ResetPassword(email: email.text.trim(),));

    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
     
      OFullScreenLoader.openLoadingDialog('Processing your request...', MyImage.loadingImage);
     
      final isConnected = await NetworkManager.instance.isConnected();
     
      if(!isConnected){
        OFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      
      OFullScreenLoader.stopLoading();
      
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your passaword'.tr);
    
    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}