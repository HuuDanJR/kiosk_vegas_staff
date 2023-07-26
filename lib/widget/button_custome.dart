import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget buttonCustom({onPressed, text, width,bool enable =false}) {
  return GestureDetector(
			onTap:enable == true ? onPressed : null,
    child: Container(
			alignment: Alignment.center,
			width: width,
			padding: EdgeInsets.symmetric(
				vertical:StringFactory.padding,
				horizontal: StringFactory.padding,
			),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(StringFactory.padding/2),
				color:enable? MyColor.yellow_accent: MyColor.grey_tab,
				border: Border.all(color:MyColor.white,width:1,),
			),
			child: textCustomNormalColorFont(
				color: MyColor.white,
				font: StringFactory.mainFont,size: 13,text: text,
			),
		),
  );
}
