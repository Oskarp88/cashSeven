import 'package:flutter/material.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class LoginHaeder extends StatelessWidget {
  const LoginHaeder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: Dimensions.height100,
          image: const AssetImage(MyImage.logoCash)
        ),
        Text(
          'Login',
          style: MyTextStyle.headlineMedium,
        ),
        SizedBox(height: Dimensions.height10),
        Text('Bienvenido', style: MyTextStyle.bodyMedium),
      ],
    );
  }
}


