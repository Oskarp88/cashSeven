import 'package:flutter/material.dart';
import 'package:survey_five/utils/device/device_utility.dart';

class OTabBar extends StatelessWidget implements PreferredSizeWidget {
  const OTabBar({
    super.key,      
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Colors.lightBlue,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.lightBlue,
        
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}