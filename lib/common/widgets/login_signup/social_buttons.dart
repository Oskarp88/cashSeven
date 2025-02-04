import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/features/authentication/controllers/login/login_controller.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.redLight5
      ),
      onPressed: ()=> controller.googleSignIn(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: Dimensions.iconMd,
            height: Dimensions.iconMd,
            image: const AssetImage(MyImage.google),
          ),
          SizedBox(width: Dimensions.defaultSpace),
          Text(
            'Sing in with Google',
            style: MyTextStyle.headlineSmall,
          ),
        ],
      ),
    );
  }
}