import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/data/repositories/user/user_repository.dart';
import 'package:survey_five/features/authentication/models/user_model.dart';
import 'package:survey_five/features/authentication/screens/signup/verify_email.dart';
import 'package:survey_five/utils/connects/network_manager.dart';
import 'package:survey_five/utils/constants/string_image.dart';
import 'package:survey_five/utils/loaders/loaders.dart';
import 'package:survey_five/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  
  final hidePassword = true.obs;
  final hidePasswordConfirm = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController(); 
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  void signup() async {
    try {

      OFullScreenLoader.openLoadingDialog('We are processing your information...', MyImage.loadingImage);
      
      final isConnected = await NetworkManager.instance.isConnected();
      
      if(!isConnected) {
        OFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if(!signupFormkey.currentState!.validate()){
        OFullScreenLoader.stopLoading(); 
        return;
      }

      if(!privacyPolicy.value){
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }

      /// singIn
      
      /// register
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.'
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}