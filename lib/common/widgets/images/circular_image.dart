import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key, 
    this.fit = BoxFit.cover, 
    required this.image, 
    this.isNetworkImage = false, 
    this.overLayColor, 
    this.backgroundColor, 
    this.width = 56, 
    this.height = 56, 
    this.padding = 10, 
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? AssetImage(image) : AssetImage(image) as ImageProvider,
        color: overLayColor
      ),
    );
  }
}