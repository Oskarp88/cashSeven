
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/styles/my_text_style.dart';
import 'package:survey_five/common/widgets/texts/section_headig.dart';
import 'package:survey_five/data/repositories/authentication/authentication_repository.dart';
import 'package:survey_five/page/profile/widgets/profile_menu.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
            title: const Text(
              'Perfil de Usuario',
              style: TextStyle(
                color: MyColors.blueLight1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
                  const Divider(color:MyColors.blackBackgroundColor,),
                  SizedBox(height: Dimensions.spaceBtwItems),
                  const SectionHeading(
                    title: 'Profile Information',
                    textColor: MyColors.greebAccentDark8,
                    // shadowColor: MyColors.greebAccentDark2,
                    showActionButton: false,
                  ),
                   
                  SizedBox(height: Dimensions.spaceBtwItems),
                  const Divider(color: MyColors.blackBackgroundColor,),
                  SizedBox(height: Dimensions.spaceBtwItems),
                  const SectionHeading(
                    title: 'Personal Information',
                    textColor: MyColors.greebAccentDark8,
                    // shadowColor: MyColors.greebAccentDark2,
                    showActionButton: false,
                  ),
                  SizedBox(height: Dimensions.spaceBtwItems),
                  ProfileMenu(
                    onPressed: (){},
                    title: 'User ID',
                    value: 'yyyyyyyyyyyyyy',
                    icon: Iconsax.copy,
                  ),
                  ProfileMenu(
                    onPressed: (){},
                    title: 'E-mail',
                    value:' user.email',
                  ),
                  
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

