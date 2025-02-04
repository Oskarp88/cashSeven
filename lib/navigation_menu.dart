import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/page/profile/profile.dart';
import 'package:survey_five/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

return Scaffold(
  bottomNavigationBar: Obx(
    () => NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white), // Color del texto del label
        ),
      ),
      child: NavigationBar(      
        backgroundColor: MyColors.blueDark9,
        indicatorColor: Colors.black.withOpacity(0.1),
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        destinations: const [
         NavigationDestination(
          icon: Icon(Iconsax.home, color: Colors.white,), 
          label: 'Home',    
         ),
         NavigationDestination(
          icon: Icon(Iconsax.shop, color: Colors.white), 
          label: 'Store'
         ),
         NavigationDestination(
          icon: Icon(Iconsax.heart, color: Colors.white), 
          label: 'Wishlist'
         ),
         NavigationDestination(
          icon: Icon(Iconsax.user, color: Colors.white), 
          label: 'Profile'
         )         
        ]
      ),
    ),
  ),
  body: Obx(() => controller.screens[controller.selectedIndex.value]),
);
 }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const Text('hola'),
    const Text('hola'),
    const Text('hola'),
    const ProfileScreen(),
  ];
}