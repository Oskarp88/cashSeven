
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()=> Get.back(), 
            icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultSpace),
          child: Column(
            children: [
              // Image(
              //   image: const AssetImage(TImage.sendEmailImage),
              //   width: Dimensions.screenWidth*0.6,
              // ),
              SizedBox(height: Dimensions.spaceBtwSections,),
              Text(
                 'Password Reset Email Sent', 
                 style: Theme.of(context).textTheme.headlineMedium,
                 textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.spaceBtwItems,),
                Text(
                  'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimensions.spaceBtwSections,),

                ///button
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: const Text('Done')
                ),
               ),
               SizedBox(height: Dimensions.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> Get.off(()=> const ResetPassword()),
                  child: const Text('Resend Email')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}