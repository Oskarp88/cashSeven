import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:survey_five/common/widgets/images/circular_image.dart';
import 'package:survey_five/utils/constants/string_image.dart';

class OUserProfileTilte extends StatelessWidget {
  const OUserProfileTilte({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: const CircularImage(
       image: MyImage.userImagen,
       height: 50, 
       width: 50,
       padding: 0,
     ),
     title: Text(
       'Oscar burgos',
       style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
     ),
     subtitle: Text(
       'burgos@gmail.com',
       style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)
     ),
     trailing: IconButton(
       onPressed: onPressed, 
       icon: const Icon(Iconsax.edit, color: Colors.white,)
     ),
    );
  }
}