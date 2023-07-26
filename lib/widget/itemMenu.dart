import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget itemMenu({width, text, onPress, icon, hasIcon = true}) {
  return Column(
    children: [
      InkWell(
        splashColor: MyColor.yellow,
        focusColor: MyColor.yellow,
        onTap: () {
          onPress();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: StringFactory.padding,
              horizontal: StringFactory.padding),
          decoration: BoxDecoration(
              color: MyColor.white, borderRadius: BorderRadius.circular(8)),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hasIcon ? icon : null,
                  SizedBox(
                    width: StringFactory.padding,
                  ),
                  textCustomNormalColorFont(
                    text: text,
                    color: MyColor.black_text,
                    font: StringFactory.mainFont,
                    size: 14,
                  )
                ],
              ),
														IconButton(onPressed: onPress, icon: Icon(Icons.arrow_forward_ios,color:MyColor.yellow_accent))
            ],
          ),
        ),
      ),
      SizedBox(
        height: StringFactory.padding,
      ),
    ],
  );
}

Widget iconCustom(icon) {
  return Icon(icon, color: MyColor.grey);
}
