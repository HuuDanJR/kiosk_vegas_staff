import 'package:flutter/material.dart';
import 'package:vegas_point_portal/rate_detail.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget itemIcon({String? type, String? text, context,onTap}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  image: AssetImage(type!),
                  fit: BoxFit.cover)),
        ),
      ),
      textCustomNormalColorFont(
          color: MyColor.black_text,
          font: StringFactory.mainFont,
          size: 16,
          text: text)
    ],
  );
}
