import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/widgets/appbar/appbar.dart';
import 'package:survey_five/common/widgets/images/circular_image.dart';
import 'package:survey_five/common/widgets/texts/section_headig.dart';
import 'package:survey_five/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:survey_five/utils/constants/dimensions.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                   children: [
                      const CircularImage(
                        image: MyImage.userImagen,
                        width: 80,
                        height: 80,
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: const Text('Change Profile Picture')
                      )
                   ],
                ),
              ),
              ////details
              SizedBox(height: Dimensions.spaceBtwItems / 2),
              const Divider(),
              SizedBox(height: Dimensions.spaceBtwItems),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(height: Dimensions.spaceBtwItems),
              ProfileMenu(
                onPressed: (){},
                title: 'Name',
                value: 'Oscar William',
              ),
               ProfileMenu(
                onPressed: (){},
                title: 'Username',
                value: 'Oskarp88',
              ),
              SizedBox(height: Dimensions.spaceBtwItems),
              const Divider(),
              SizedBox(height: Dimensions.spaceBtwItems),
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              SizedBox(height: Dimensions.spaceBtwItems),
              ProfileMenu(
                onPressed: (){},
                title: 'User ID',
                value: '12837474',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onPressed: (){},
                title: 'E-mail',
                value: 'burgos@gmail.com',
              ),
              ProfileMenu(
                onPressed: (){},
                title: 'Phone number',
                value: '319.........',
              ),
              ProfileMenu(
                onPressed: (){},
                title: 'Gender',
                value: 'Male',
              ),
              ProfileMenu(
                onPressed: (){},
                title: 'Date of Birth',
                value: '21 agosto 1990',
              ),
              SizedBox(height: Dimensions.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){}, 
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

