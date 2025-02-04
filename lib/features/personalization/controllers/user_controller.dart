import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:survey_five/data/repositories/user/user_repository.dart';
import 'package:survey_five/features/authentication/models/user_model.dart';
import 'package:survey_five/utils/loaders/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

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
}