
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/features/authentication/controllers/forget_password/forget_passoword_controller.dart';
import 'package:survey_five/features/authentication/screens/login/login.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()=> Get.back(), 
            icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(MyImage.sendEmailImage),
                width: Dimensions.screenWidth*0.6,
              ),
              SizedBox(height: Dimensions.spaceBtwSections,),
              Text(
                 email, 
                 style: MyTextStyle.titleMedium,
                 textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.spaceBtwSections,),
              Text(
                 'Password Reset Email Sent', 
                 style: MyTextStyle.headlineMedium,
                 textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.spaceBtwItems,),
                Text(
                  "Your account security is our priority! We've sent you a secure link to safely reset your password and protect your account.",
                  style: MyTextStyle.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimensions.spaceBtwSections,),

                ///button
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()), 
                  child: const Text('Done')
                ),
               ),
               SizedBox(height: Dimensions.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: Text(
                    'Resend Email',
                    style: MyTextStyle.titleLarge,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}