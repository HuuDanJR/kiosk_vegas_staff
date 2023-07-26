import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

buildProgressLine({itemWidth, point_frame}) {
  return Column(
    children: [
      Container(
          width: itemWidth,
          height: StringFactory.padding32,
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(StringFactory.padding4
										),
          ),
          child: Row(
            children: [
              buildItemProgress(color: MyColor.grey_tab,itemWidth: itemWidth,maxValue: 20000,minValue: 0,point_frame: point_frame,),
              buildItemProgress(color: MyColor.grey_BG,itemWidth: itemWidth,maxValue: 100000,minValue: 20000,point_frame: point_frame,),
              buildItemProgress(color: MyColor.grey_tab,itemWidth: itemWidth,maxValue: 320000,minValue: 100000,point_frame: point_frame,),
              buildItemProgress(color: MyColor.grey_BG,itemWidth: itemWidth,maxValue: 1000000,minValue: 320000,point_frame: point_frame,),
            ],
          )),
      Container(
        width: itemWidth,
        height: StringFactory.padding32, //32
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StringFactory.padding4),
        ),
        child: Row(
          children: [
            buildTextCol(itemWidth: itemWidth, level: 'P', point: '0 pts'),
            buildTextCol(itemWidth: itemWidth, level: 'I', point: '20,000 pts'),
            buildTextCol(itemWidth: itemWidth, level: 'V', point: '100,000 pts'),
            SizedBox(
                width: itemWidth / 4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textCustom(
                            size: 11,
                            text: 'One',
                          ),
                          textCustom(
                            size: 8.5,
                            text: '320,000 pts',
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          textCustom(
                            size: 11,
                            text: 'One+',
                          ),
                          textCustom(
                            size: 8.5,
                            text: '1,000,000 pts',
                          ),
                        ],
                      ),
                    ])),
          ],
        ),
      )
    ],
  );
}

Widget buildItemProgress(
    {point_frame, itemWidth, int? minValue, int? maxValue,color}) {
  return Container(
				color: color,
				width: (itemWidth)/4 ,	
    child: Stack(
      children: [
        Container(
          width: point_frame >= minValue && point_frame < maxValue
              ? itemWidth / 4 * (point_frame / maxValue)
              : itemWidth / 4,
          color: point_frame >= minValue && point_frame < maxValue
              ? MyColor.yellow_accent
              : point_frame > maxValue
                  ? MyColor.yellow_accent
                  : Colors.transparent,
        ),
      ],
    ),
  );
}

Widget buildTextCol({itemWidth, level, point}) {
  return SizedBox(
    width: itemWidth / 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textCustom(
          size: 11,
          text: '$level',
        ),
        textCustom(
          size: 8.5,
          text: '$point',
        ),
      ],
    ),
  );
}


 // static final Color grey_tab = Color(0xFFE0E0E0);
 // static final Color grey_BG = Color(0xFFeeeeee);
