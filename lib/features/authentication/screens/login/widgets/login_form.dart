import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/features/authentication/controllers/login/login_controller.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:survey_five/features/authentication/screens/signup/signup.dart';
import 'package:survey_five/navigation_menu.dart';
import 'package:survey_five/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.white,
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              style: MyTextStyle.titleMedium,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: Dimensions.spaceBtwInputFields,),
            Obx(
              () => TextFormField(
                cursorColor: Colors.white,
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyText('Password',value),
                obscureText: controller.hidePassword.value,
                style: MyTextStyle.titleMedium,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () =>  controller.hidePassword.value = ! controller.hidePassword.value, 
                    icon: Icon(
                      controller.hidePassword.value 
                       ?Iconsax.eye_slash
                       :Iconsax.eye
                    ))
                ),
              ),
            ),
            SizedBox(height: Dimensions.spaceBtwInputFields/2),
            /// remenber me & forget password 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///remenber me
                 Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value, 
                        onChanged: (value)=>controller.rememberMe.value = !controller.rememberMe.value
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: MyTextStyle.titleMedium,
                    )
                  ],
                 ),
                 //forgot
                 TextButton(
                  onPressed: ()=> Get.to(() => const ForgotPassword()), 
                  child: Text(
                    'Forgot password',
                    style: MyTextStyle.labelLarge,
                  )
                 ),
              ],
            ),
            SizedBox(height: Dimensions.spaceBtwSections,),
        
            ///Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> controller.emailAndPasswordSingIn(), 
                child: const Text('Sing In')
              ),
            ),
            ///Create In Button
            SizedBox(height: Dimensions.spaceBtwInputFields,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()), 
                child: const Text('Create Account')
              ),
            ),
          ],
        ),
      )
    );
  }
}