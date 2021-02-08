import 'package:flutter/material.dart';
import 'package:sy_flutter_plugin/widgets/ytabbar/y_tabbar_item.dart';

class YTabBar extends BottomNavigationBar {
  final fontSize;
  final selectedFontSize;
  final selectedIndex;
  final List<YTabBarItem> barItems;
  final onSelected;

  YTabBar({
    this.fontSize = 14,
    this.selectedFontSize = 14,
    this.selectedIndex = 0,
    @required this.barItems,
    this.onSelected
  })
  : super(
    unselectedFontSize:  fontSize,
    selectedFontSize: selectedFontSize,
    items: barItems,
    onTap: onSelected,
  );
}