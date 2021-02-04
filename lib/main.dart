import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sy_flutter_plugin/Configs/colors_config.dart';
import 'package:sy_flutter_plugin/Widgets/tags_grid_view.dart';
import 'package:sy_flutter_plugin/widgets/sy_custom_card.dart';

import 'widgets/sy_divide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SY Additions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SYHomePage(),
    );
  }
}

class SYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SY Additions'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SYCustomCard(
                insideWidget:
                    SYTagsGridView(tagList: ['张三', '李四', '王五', '赵六']),
                sEdgeInsets: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(16),
                  ScreenUtil().setWidth(10),
                  ScreenUtil().setWidth(16),
                  ScreenUtil().setWidth(10))
              ),
              Divide(type: DivideType.Center,)
            ],
          ),
        ),
      ),
    );
  }
}
