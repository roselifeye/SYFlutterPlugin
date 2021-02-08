import 'package:flutter/widgets.dart';

class YTabBarItem extends BottomNavigationBarItem {
  YTabBarItem({
    String title,
    @required Image iconAsset,
    Image selectedIconAsset})
  : super(
    label: title,
    icon: iconAsset,
    activeIcon: selectedIconAsset
  );
}