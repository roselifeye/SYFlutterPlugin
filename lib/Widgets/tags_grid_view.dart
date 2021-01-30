/*
* Tags Grid View.
* */
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sy_flutter_plugin/Configs/colors_config.dart';
import 'package:flutter/material.dart';

class SYTagsGridView extends StatelessWidget {
  final List<String> tagList;
  final bool selectable;
  final selectedIndex;
  final ValueChanged selectCallback;
  SYTagsGridView(
      {@required this.tagList,
      this.selectable = false,
      this.selectedIndex = 0,
      this.selectCallback});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(16),
          right: ScreenUtil().setWidth(16),
          left: ScreenUtil().setWidth(16),
          bottom: ScreenUtil().setWidth(16)
      ),
      crossAxisCount: 3,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      crossAxisSpacing: ScreenUtil().setSp(24),
      mainAxisSpacing: ScreenUtil().setSp(18),
      shrinkWrap: true,
      reverse: false,
      childAspectRatio: 110 / 36,
      children: List.generate(
          tagList.length,
          (index) => Container(
                // child: Text("Hello"),
                child: GestureDetector(
                    onTap: !selectable
                        ? null
                        : () {
                            selectCallback(index);
                          },
                    child: selectable
                        ? SYTagItem(
                            content: tagList[index],
                            isSelected: selectedIndex == index,
                          )
                        : SYTagItem(
                            content: tagList[index],
                          )),
              )),
    );
  }
}

// Tag Item Setup
class SYTagItem extends StatelessWidget {
  final content;
  final int index;
  final bool isSelected;
  SYTagItem({this.content, this.index = 0, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(9),
          ScreenUtil().setWidth(2),
          ScreenUtil().setWidth(9),
          ScreenUtil().setWidth(2)),
      decoration: BoxDecoration(
          color: isSelected ? ColorsConfig.c_e9f7f8 : ColorsConfig.c_f7f7f7,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(content,
          style: TextStyle(
              color: isSelected
                  ? ColorsConfig.kLeftBackColor
                  : ColorsConfig.kColorBlack,
              fontSize: ScreenUtil().setSp(14))),
    );
  }
}
