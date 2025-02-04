import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/features/authentication/screens/password_configuration/reset_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blueDark9,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:  Padding(
        padding: EdgeInsets.all(Dimensions.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///headings
            Text(
              'Forgot Password',
               style: MyTextStyle.headlineMedium,
            ),
            SizedBox(height: Dimensions.spaceBtwItems),
            Text(
              'Don´t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
              style: MyTextStyle.labelMedium
            ),
            SizedBox(height: Dimensions.spaceBtwSections * 2),
            ///text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon:  Icon(Iconsax.direct_right) 
              ),
            ),
            SizedBox(height: Dimensions.spaceBtwSections),
            ///Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> Get.off(()=> const ResetPassword()),
                child: const Text('Submit')
              ),
            ),
          ],
        ),
      ),
    );
  }
}