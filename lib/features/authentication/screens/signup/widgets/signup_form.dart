import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/features/authentication/controllers/signup/signup_controller.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController(), permanent: true);
    // final privacyPolicy = SignupController.instance.privacyPolicy;
    return Form(
      key: controller.signupFormkey,
      child: Column(      
      children: [
        TextFormField(
          controller: controller.email,
          style: GoogleFonts.aBeeZee(
            color: MyColors.wesAsphalt0,
            fontWeight: FontWeight.w600,
          ),
          validator: (value) => TValidator.validateEmail(value),
          cursorColor: MyColors.wesAsphalt0,
          decoration: const InputDecoration(
            labelText: 'Correo electronico',
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        SizedBox(height: Dimensions.spaceBtwItems),
        Obx(
          () => TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            style: GoogleFonts.aBeeZee(
              color: MyColors.wesAsphalt0,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: MyColors.wesAsphalt0,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                icon: controller.hidePassword.value 
                  ? const Icon(Iconsax.eye_slash) 
                  : const Icon(Iconsax.eye) 
              )
            ),
          ),
        ),
         SizedBox(height: Dimensions.spaceBtwItems),
        Obx(
          () => TextFormField(
            controller: controller.passwordConfirm,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: controller.hidePasswordConfirm.value,
            style: GoogleFonts.aBeeZee(
              color: MyColors.wesAsphalt0,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: MyColors.wesAsphalt0,
            decoration: InputDecoration(
              labelText: 'Confirmar contraseña',
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () => controller.hidePasswordConfirm.value = !controller.hidePasswordConfirm.value, 
                icon: controller.hidePasswordConfirm.value 
                  ? const Icon(Iconsax.eye_slash)
                  : const Icon(Iconsax.eye)
              )
            ),
          ),
        ),
        SizedBox(height: Dimensions.spaceBtwItems),
        //Terms&conditions Checkbox
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Obx(
                () => Checkbox(
                  value: controller.privacyPolicy.value, 
                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value
                ),
              ),
            ),
            SizedBox(width: Dimensions.spaceBtwItems),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: 'Agree to ', style: MyTextStyle.bodySmall),
                TextSpan(text: 'privacyPolicy ', style: MyTextStyle.bodyMedium.apply(
                  color:  MyColors.yellow5,
                )),
                TextSpan(text: 'and ', style: MyTextStyle.bodySmall),
                TextSpan(text: 'terms of use', style: MyTextStyle.bodyMedium.apply(
                  color: MyColors.yellow5,
                )),
              ]
            ))
    
          ],
        ),
        SizedBox(height: Dimensions.spaceBtwSections),
        //sign up button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: ()=> controller.signup(), 
            child: const Text('Create Account')
          ),
        )
      ],
    ));
  }
}