import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/common/widgets/login_signup/form_divider.dart';
import 'package:survey_five/common/widgets/login_signup/social_buttons.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/features/authentication/screens/signup/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.wesAsphalt0), // Cambia el color de la flecha de atrás
        backgroundColor: MyColors.blueDark9,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text('Let´s create your account', style: MyTextStyle.headlineMedium,),
              SizedBox(height: Dimensions.spaceBtwSections,),
              //form
              const SignUpForm(),
              //divider
              SizedBox(height: Dimensions.spaceBtwSections,),
              const FormDivider(dividetText: 'or sign up with'),
              SizedBox(height: Dimensions.spaceBtwSections,),
              //special button
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

