import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      backgroundColor: MyColors.blueDark7,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.blueDark9,
        iconTheme: const IconThemeData(color: MyColors.white),
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout() , 
            icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Column(
            children: [
               //image
               Image(
                image: const AssetImage(MyImage.verifyEmailImage),
                width: Dimensions.screenWidth*0.6,
               ),
               SizedBox(height: Dimensions.spaceBtwSections),
               //title & subtitle
               Text(
                'Verify your email address!', 
                 style: MyTextStyle.headlineMedium,
                 textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimensions.spaceBtwItems),
                Text(
                 email ?? '', 
                 style: MyTextStyle.labelLarge,
                 textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimensions.spaceBtwItems),
                Text(
                'Congratulations your account awaits verify your email', 
                 style: MyTextStyle.labelMedium,
                 textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimensions.spaceBtwSections),

               ///button
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text('Continue'),
                ),
               ),
              SizedBox(height: Dimensions.spaceBtwItems),
               SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(), 
                  child: Text(
                    'Resend Email',
                    style: MyTextStyle.headlineSmall,
                  )
                ),
               ),
            ],
          )
        ),
      ),
    );
  }
}