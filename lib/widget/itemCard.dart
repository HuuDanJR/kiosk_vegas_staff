import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget itemCard({width, text,text2,bool hasIcon = false,onPress }) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
            vertical: StringFactory.padding,
            horizontal: StringFactory.padding16),
        decoration: BoxDecoration(
            color: MyColor.grey_tab_opa,
            borderRadius: BorderRadius.circular(8)),
        width: width,
        child: Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textCustomNormalColorFont(
              text: text,
              color: MyColor.black_text,
              font: StringFactory.mainFont,
              size: 14,
            ),
            Row(
              children: [
                textCustomNormalColorFont(
                  text: text2,
                  color: MyColor.black_text,
                  font: StringFactory.mainFont,
                  size: 14,
                ),
																IconButton(onPressed: hasIcon == true ? onPress : null , icon: hasIcon == true ? Icon(Icons.arrow_forward_ios,color:MyColor.yellow_accent,size:26):  Container()),
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: StringFactory.padding,
      ),
    ],
  );
}
Widget itemCardWithButton({width, text,text2,button,onPress}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
            vertical: StringFactory.padding,
            horizontal: StringFactory.padding16),
        decoration: BoxDecoration(
            color: MyColor.grey_tab_opa,
            borderRadius: BorderRadius.circular(8)),
        width: width,
        child: Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textCustomNormalColorFont(
              text: text,
              color: MyColor.black_text,
              font: StringFactory.mainFont,
              size: 14,
            ),
            Row(
              children: [
                textCustomNormalColorFont(
                  text: text2,
                  color: MyColor.black_text,
                  font: StringFactory.mainFont,
                  size: 14,
                ),
																SizedBox(width:StringFactory.padding),
																TextButton(onPressed: onPress, child: textCustomNormalColorFont(
                  text: button,
                  color: MyColor.blue,
                  font: StringFactory.mainFont,
                  size: 14,
                ),)
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: StringFactory.padding,
      ),
    ],
  );
}

