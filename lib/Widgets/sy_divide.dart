import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sy_flutter_plugin/Configs/colors_config.dart';

/// DivideType
/// iOSTableDefault: The design of the separator in the iOS table view,
/// Full: The design of the flutter system
/// Center: The design of left:16, right:16 divider,
/// Custom: Customize the left and right margins.
enum DivideType {
  iOSTableDefault,
  Full,
  Center,
  Custom
}

/// Custom Divider
/// Reason: Cuz the system one has no margin, does not math the Apple Design.
/// DivideType: The type of the Divider,
/// EdgeInsets: It only works when the type is Custom,
/// Color: Default 0x14000000
class Divide extends StatelessWidget {
  final DivideType type;
  final EdgeInsets customEdgeIns;
  final Color divideColor;
  Divide({@required this.type, this.customEdgeIns, this.divideColor=ColorsConfig.c_14000000});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: divideColor,
                offset: Offset(0.0, -0.5), //阴影xy轴偏移量
                blurRadius: 0.0, //阴影模糊程度
                spreadRadius: 0.0 //阴影扩散程度
            )
          ]),
      height: ScreenUtil().setWidth(1),
      width: double.infinity,
      margin: type==DivideType.Custom ? divideColor : EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0,
          ScreenUtil().setWidth(16), 0),
    );
  }
}
