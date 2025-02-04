import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'app.dart';
import 'firebase_options.dart';
Future<void> main() async {
  //add widget of flutter app
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //local storage
  await GetStorage.init();
  // initialize firebase
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(const MyApp());
}

