import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/// Custom Card View
/// required parameters
/// insideWidget: Put the inside display widgets here,
/// sEdgeInsets: Add the LTRB margin of the card,
/// backgroundColor: Default White,
/// shadowColor: Default 0x14000000
class SYCustomCard extends StatelessWidget {
  final Widget insideWidget;
  final EdgeInsets sEdgeInsets;
  final Color backgroundColor;
  final Color shadowColor;
  SYCustomCard({
    @required this.insideWidget,
    @required this.sEdgeInsets,
    this.backgroundColor = Colors.white,
    this.shadowColor = const Color(0x14000000),
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: sEdgeInsets,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                offset: Offset(0.0, 0.0), //阴影xy轴偏移量
                blurRadius: 12.0, //阴影模糊程度
                spreadRadius: 0.0 //阴影扩散程度
            )
          ]),
      child:insideWidget,
    );
  }
}
