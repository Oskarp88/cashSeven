import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/features/personalization/controllers/user_controller.dart';
import 'package:survey_five/utils/connects/network_manager.dart';
import 'package:survey_five/utils/constants/string_image.dart';
import 'package:survey_five/utils/loaders/loaders.dart';
import 'package:survey_five/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController{
  
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }
  
  Future<void> emailAndPasswordSingIn() async{
    try {
      OFullScreenLoader.openLoadingDialog('Logging you in', MyImage.loadingImage);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        OFullScreenLoader.stopLoading();
        return;
      }
      if(!loginFormKey.currentState!.validate()){
        OFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      
      await userController.saveUserRecord(userCredentials);

      OFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async{
    try {
      OFullScreenLoader.openLoadingDialog('Loggin you in...', MyImage.loadingImage);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        OFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      OFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}