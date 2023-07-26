import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/model/dateframedata.dart';
import 'package:vegas_point_portal/pointlist.dart';
import 'package:vegas_point_portal/util/detect_platform.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/datePick.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/progressLinePoint.dart';
import 'package:vegas_point_portal/widget/progressPoint.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget bodyPoint(
    {shakeKey,
    onPressDialog,
    onPressDialogFrame,
    onPressDialogCustomer,
    NumberFormat? formatNum,
    context,
    tierName,
    StringFormat? format,
    dateFrame,
    width,
    height,
    itemWidth,
    date1Func,
    date2Func,
    int? point_custom,
    required int point_frame,
    name,
    number,
    dateofbirth,
    point_current,
    point_daily,
    point_rl_tb,
    point_slot,
    point_weekly,
    point_monthly,
    startDate,
    endDate}) {
  Widget rowNextLevel(formatNum) {
    return Row(
      children: [
        textCustomGrey(text: 'Next Level: ', size: 16),
        textCustom(
          text: point_frame >= 0 && point_frame < 20000
              ? "${formatNum.format(20000 - point_frame)}"
              : point_frame >= 20000 && point_frame < 100000
                  ? "${formatNum.format(100000 - point_frame)}"
                  : point_frame >= 100000 && point_frame < 320000
                      ? "${formatNum.format(320000 - point_frame)}"
                      : point_frame >= 32000 && point_frame < 1000000
                          ? "${formatNum.format(1000000 - point_frame)}"
                          : point_frame >= 1000000
                              ? "Max Level"
                              : point_frame == -1
                                  ? "20,000"
                                  : point_frame == 0
                                      ? "20,000"
                                      : '...',
          size: 16,
        ),
      ],
    );
  }

  return SizedBox(
    height: height,
    width: width,
    child: ListView(
      children: [
        textCustom(
          text: 'Point Detail',
          size: 16,
        ),
        SizedBox(height: StringFactory.padding16),
        rowCenter(isMobile: detectPlatform(), children: [
          buildRow2(text: 'Mr/Mrs:', value: '$name', width: itemWidth),
          buildRow2Container(
              width: itemWidth,
              children: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      textCustomGrey(text: "CN: ", size: 16),
                      textCustom(text: '$number', size: 16),
                    ],
                  ),
                  Row(
                    children: [
                      textCustomGrey(text: "BOD: ", size: 16),
                      textCustom(text: '$dateofbirth', size: 16),
                    ],
                  ),
                ],
              )),
        ]),
        SizedBox(height: StringFactory.padding16),
        rowCenter(isMobile: detectPlatform(), children: [
          buildRow2(
              text: 'Current Point:',
              value: formatNum!.format(int.parse(point_current)),
              width: itemWidth),
          buildRow2Container(
              width: itemWidth,
              children: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      textCustomGrey(text: "Daily: ", size: 16),
                      textCustom(
                          text: formatNum.format(int.parse(point_daily)),
                          size: 16),
                    ],
                  ),
                  Row(
                    children: [
                      textCustomGrey(text: "Slot: ", size: 16),
                      textCustom(
                          text: formatNum.format(int.parse(point_slot)),
                          size: 16),
                    ],
                  ),
                  Row(
                    children: [
                      textCustomGrey(text: "RL & TB: ", size: 16),
                      textCustom(
                          text: formatNum.format(int.parse(point_rl_tb)),
                          size: 16),
                    ],
                  )
                ],
              )),
        ]),
        SizedBox(height: StringFactory.padding16),
        rowCenter(isMobile: detectPlatform(), children: [
          buildRow2(
              hasIcon: true,
              onPressed: () {
                onPressDialog();
              },
              text: 'Weekly Point:',
              value: formatNum.format(int.parse(point_weekly)),
              width: itemWidth),
          buildRow2(
              text: 'Monthly Point',
              value: formatNum.format(int.parse(point_monthly)),
              width: itemWidth),
        ]),
        SizedBox(height: StringFactory.padding48),

        textCustom(
          text: 'Frame Point',
          size: 16,
        ),
        SizedBox(height: StringFactory.padding16),
        //ROW FRAME POINT
        rowCenter(isMobile: detectPlatform(), children: [
          buildRow2(
            // hasIcon:false,
            hasIcon: point_frame == '' || point_frame == 0 || point_frame == -1
                ? false
                : true,
            onPressed: () {
              onPressDialogFrame();
            },
            hasChildRow: dateFrame == '' ? false : true,
            width: itemWidth,
            // value: '$point_frame',
            value: point_frame == -1 || point_frame == ''
                ? '0'
                : '${formatNum.format((point_frame.abs()))}',
            dateFrame: '$dateFrame',
            text: 'Frame Point',
          ),
          // ProgressPoint(width: itemWidth,),
          Column(
            children: [
              Container(
                width: itemWidth,
                padding: EdgeInsets.all(StringFactory.padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StringFactory.padding4),
                  border: Border.all(
                    color: MyColor.grey_tab,
                    width: 1,
                  ),
                  // borderRadius: BorderRadius.circular(10),
                  color: MyColor.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            textCustomGrey(text: 'Current Level: ', size: 16),
                            textCustom(text: '$tierName', size: 16),
                          ],
                        ),
                        Row(
                          children: [
                            textCustomGrey(text: 'Frame Level: ', size: 11),
                            textCustom(
                                text: point_frame >= 0 && point_frame < 20000
                                    ? "P"
                                    : point_frame >= 20000 &&
                                            point_frame < 100000
                                        ? 'I'
                                        : point_frame >= 100000 &&
                                                point_frame < 320000
                                            ? 'V'
                                            : point_frame >= 320000 &&
                                                    point_frame < 1000000
                                                ? 'One'
                                                : point_frame > 1000000
                                                    ? 'One+'
                                                    : 'P',
                                size: 11),
                          ],
                        ),
                       detectPlatform() == true ? rowNextLevel(formatNum) : Container()
                      ],
                    ),
                    detectPlatform() == false ? rowNextLevel(formatNum) : Container()
                  ],
                ),
              ),
              SizedBox(height: StringFactory.padding16),
              // ROW INDICATOR LINE
              buildProgressLine(itemWidth: itemWidth, point_frame: point_frame)
              //END ROW INDICATOR LINE
            ],
          ),
        ]),
        SizedBox(height: StringFactory.padding48),
        textCustom(
          text: 'Custom Check',
          size: 16,
        ),
        SizedBox(height: StringFactory.padding16),
        rowCenter(isMobile: detectPlatform(), children: [
          Container(
              padding: const EdgeInsets.only(left: 10),
              width: itemWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StringFactory.padding4),
                  color: MyColor.white,
                  border: Border.all(color: MyColor.grey_tab)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textCustomNormal(
                      text: format!.formatDate(startDate) == "2020-01-01"
                          ? 'From: '
                          : 'From: ${format.formatDate(startDate)}',
                      size: 16),
                  IconButton(
                      onPressed: () {
                        debugPrint('click select date 1');
                        selectDate(context: context).then((value) {
                          if (value == null) {
                            return;
                          }
                          date1Func(value);
                        });
                      },
                      icon:
                          Icon(Icons.calendar_month, color: MyColor.black_text))
                ],
              )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              width: itemWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StringFactory.padding4),
                  color: MyColor.white,
                  border: Border.all(color: MyColor.grey_tab)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textCustomNormal(
                      text: format.formatDate(endDate) == "2020-01-01"
                          ? 'To: '
                          : 'To: ${format.formatDate(endDate)}',
                      size: 16),
                  IconButton(
                    onPressed: () {
                      debugPrint('click select date 2');
                      selectDate(context: context).then((value) {
                        if (value == null) {
                          return;
                        }
                        date2Func(value);
                      });
                    },
                    icon: Icon(Icons.calendar_month, color: MyColor.black_text),
                  )
                ],
              )),
        ]),
        SizedBox(height: StringFactory.padding16),
        rowCenter(isMobile: detectPlatform(), children: [
          buildRow2(
              hasIcon: point_custom == -1 || point_custom == 0 ? false : true,
              hasShakeFunc: true,
              onPressed: () {
                onPressDialogCustomer();
              },
              shakeKey: shakeKey,
              text: 'Range Point:',
              value: point_custom == -1 ? "" : formatNum.format((point_custom)),
              width: itemWidth),
        ]),
      ],
    ),
  );
}

