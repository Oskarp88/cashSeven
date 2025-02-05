import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/features/personalization/controllers/user_controller.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/validators/validation.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blueDark9,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Re-Authenticate User', style: MyTextStyle.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  style: MyTextStyle.bodyLarge,
                  cursorColor: Colors.white,
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'Email'
                  ),
                ),
                SizedBox(height: Dimensions.spaceBtwInputFields,),
                Obx(
                  () => TextFormField(
                    style: MyTextStyle.bodyLarge,
                    cursorColor: Colors.white,
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => TValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(
                          controller.hidePassword.value 
                            ? Iconsax.eye_slash
                            : Iconsax.eye
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                     child: const Text('Verify')
                    ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}