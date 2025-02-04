import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_five/features/authentication/screens/login/login.dart';
import 'package:survey_five/features/authentication/screens/signup/verify_email.dart';
import 'package:survey_five/navigation_menu.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override 
  void onReady(){
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    }else{
      Get.offAll(()=>const LoginScreen());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password)async{
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  ///register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async{
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> sendEmailVerification()async{
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> logout() async{
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }
}