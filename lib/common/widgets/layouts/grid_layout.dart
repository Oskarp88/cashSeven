import 'package:flutter/material.dart';
import 'package:survey_five/utils/constants/dimensions.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key, 
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288, 
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     itemCount: itemCount,
     shrinkWrap: true,
     padding: EdgeInsets.zero,
     physics: const AlwaysScrollableScrollPhysics(),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       mainAxisExtent: mainAxisExtent,
       mainAxisSpacing: Dimensions.defaultSpace,
       crossAxisSpacing: Dimensions.defaultSpace,
        
     ) ,
     itemBuilder: itemBuilder,
    );
  }
}

