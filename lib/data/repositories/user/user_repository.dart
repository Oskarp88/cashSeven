import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }
  
   Future<UserModel> fecthUserDetails() async{
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }

  Future<void> removeUserRecord(String userId) async{
    try {
      await _db.collection('Users').doc(userId).delete();
    } catch (e) {
      throw 'Something sent wrong. Please try again $e';
    }
  }
}