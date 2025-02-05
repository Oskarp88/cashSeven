
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/common/widgets/texts/section_headig.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/features/personalization/controllers/user_controller.dart';
import 'package:survey_five/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:survey_five/page/profile/widgets/profile_menu.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    double screenwidth = MediaQuery.of(context).size.width;

    return  Stack(
      children: [
        //  Positioned.fill(
        //       child: Image.asset(
        //         ImageUrlConstants.fondoProfile, 
        //         fit: BoxFit.cover, 
        //         color: ColorsConstants.blueDark2,
        //       ),
        //     ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.blueDark9,
            title: Text(
              'Perfil de Usuario',
              style: MyTextStyle.headlineMedium,
            ),
          ),
        
          ///body
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all( Dimensions.defaultSpace),
              child: Column(
                children: [
                  ///profile picture
                  SizedBox(height: Dimensions.spaceBtwItems / 2),
                  const SectionHeading(
                    title: 'Personal Information',
                    textColor: MyColors.greebAccentDark0,
                    // shadowColor: MyColors.greebAccentDark2,
                    showActionButton: false,
                  ),
                  SizedBox(height: Dimensions.spaceBtwItems),
                  Obx(
                    () => ProfileMenu(
                      onPressed: (){},
                      title: 'User ID',
                      value: controller.user.value.id,
                    ),
                  ),
                  SizedBox(height: Dimensions.spaceBtwItems),
                  Obx(
                    () => ProfileMenu(
                      onPressed: (){},
                      title: 'E-mail',
                      value: controller.user.value.email,
                    ),
                  ),
                   SizedBox(height: Dimensions.spaceBtwItems),
                   IconButton(
                    onPressed: () => controller.deleteAccountWarningPopup(), 
                    icon: Text('Account delete', style: MyTextStyle.headlineSmall.apply(color: Colors.red)),
                  ),
                  SizedBox(height: Dimensions.height30,),
                  GestureDetector(
                    onTap: () async {
                      bool? confirm = await showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("¿Cerrar sessión?"),
                            content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false), 
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true), 
                                child: const Text("Aceptar"),
                              )
                            ],
                          );
                        }
                      );
                      if(confirm == true){
                        await AuthenticationRepository.instance.logout();
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [                     
                        Image(
                          width: screenwidth * 0.4,
                          image: const AssetImage(MyImage.buttonRed)
                        ),
                        Text(
                          'Cerrar session',
                          style: MyTextStyle.titleMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

