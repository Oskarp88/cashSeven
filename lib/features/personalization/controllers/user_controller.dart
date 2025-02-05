import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/data/repositories/user/user_repository.dart';
import 'package:survey_five/features/authentication/models/user_model.dart';
import 'package:survey_five/features/authentication/screens/login/login.dart';
import 'package:survey_five/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:survey_five/utils/connects/network_manager.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';
import 'package:survey_five/utils/loaders/loaders.dart';
import 'package:survey_five/utils/popups/full_screen_loader.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.find<UserRepository>();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord()async{
    try {
      profileLoading.value = true;
      final user = await userRepository.fecthUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try {
      if(userCredential != null){
        final user = UserModel(
          id: userCredential.user!.uid, 
          email: userCredential.user!.email ?? ''
        );
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your instance information. You can re-save your data in your Profile.'
      );
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      titleStyle: GoogleFonts.aDLaMDisplay(
        color: MyColors.blueDark8
      ),
      middleTextStyle:  GoogleFonts.aDLaMDisplay(
        color: MyColors.blueDark8
      ),
      backgroundColor: MyColors.blue1,
      contentPadding:  EdgeInsets.all(Dimensions.height10),
      title: 'Delete Account',
      middleText: 'Are you sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, side: const BorderSide(color: Colors.red),
        ), 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20*1.5),
          child: Text('Delete', style: MyTextStyle.headlineSmall,),
        ),
        ),
      cancel: OutlinedButton(
        style: OutlinedButton.styleFrom(side: const BorderSide(color: MyColors.blueDark8, width: 2)),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), 
        child: Text('Cancel', style: MyTextStyle.headlineSmall.apply(color: MyColors.blueDark8)),
      )
    );
  }

  void deleteUserAccount() async {
    try {
      OFullScreenLoader.openLoadingDialog('Processing', MyImage.loadingImage);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          OFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }else if(provider == 'password'){
          OFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthenticateUserLoginForm());
        }
      }
    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      OFullScreenLoader.openLoadingDialog('Processing', MyImage.loadingImage);

      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        OFullScreenLoader.stopLoading();
        return;
      }
      if(!reAuthFormKey.currentState!.validate()){
        OFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      OFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      OFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}