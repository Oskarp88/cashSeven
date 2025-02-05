import 'package:bitlabs/bitlabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:survey_five/data/repositories/user/user_repository.dart';
import 'package:survey_five/features/authentication/screens/login/login.dart';
import 'package:survey_five/features/authentication/screens/signup/verify_email.dart';
import 'package:survey_five/features/personalization/controllers/user_controller.dart';
import 'package:survey_five/navigation_menu.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override 
  void onReady(){
    screenRedirect();
  }

  screenRedirect() async {
     Get.lazyPut<UserRepository>(() => UserRepository());
     Get.put(UserController());
    final user = _auth.currentUser;
    if(user != null){
      BitLabs.instance.init(dotenv.env['TOKEN_KEY'].toString(), user.uid);
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

  Future<UserCredential> signInWithGoogle()async{
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, 
        idToken: googleAuth?.idToken
      );
      return await _auth.signInWithCredential(credentials);
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

  Future<void> sendPasswordResetEmail(String email)async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> logout() async{
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> reAuthenticateEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
   
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }
}