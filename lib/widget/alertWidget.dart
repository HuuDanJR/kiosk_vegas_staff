import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget alertWidget({visible, width, start, onPress}) {
  return Visibility(
    visible: visible,
    child: Positioned(
      top: StringFactory.padding,
      right: StringFactory.padding,
      child: Container(
        width: width / 3,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: MyColor.yellow_accent,
            border: Border.all(color: MyColor.white),
            borderRadius: BorderRadius.circular(7.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textCustomNormalColor(
                color: MyColor.white,
                size: 18,
                text: 'Auto back to home page in $start'),
            IconButton(
                onPressed: () {
                  // debugPrint('click cancel back function');
                  onPress();
                },
                icon:  Icon(Icons.close,color:MyColor.white))
          ],
        ),
      ),
    ),
  );
}
