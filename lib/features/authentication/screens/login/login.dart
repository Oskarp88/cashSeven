
import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/spacing_styles.dart';
import 'package:survey_five/common/widgets/login_signup/form_divider.dart';
import 'package:survey_five/common/widgets/login_signup/social_buttons.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/features/authentication/screens/login/widgets/login_form.dart';
import 'package:survey_five/features/authentication/screens/login/widgets/login_header.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///logo, title $ Sub-title
               const LoginHaeder(),
              ///form
               const LoginForm(),
              ///divider
               const FormDivider(dividetText: 'Or sign in with',),
               SizedBox(height: Dimensions.spaceBtwSections),
              ///Footer
               const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}



