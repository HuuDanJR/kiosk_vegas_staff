import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/model/status_range.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/widget.dart';

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  // print(days);
  return days;
}
Widget itemListInMonth(
    {String? dateStart, String? dateDisplay,NumberFormat? formatNum,ServiceAPIs? service_api,number}) {
  return FutureBuilder(
      future: service_api?.postPointNumberRange(
        number: number,
        // endDate: getEndDateFromDateStart(format.stringToDate(dateStart)),
        endDate: dateStart,
        startDate: dateStart,
      ),
      builder: (context, snapshot) {
        late StatusRange model = snapshot.data as StatusRange;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return myprogress_circular();
        }
        return Container(
            decoration:
                BoxDecoration(border: Border.all(color: MyColor.grey_tab)),
            child: Material(
                color: MyColor.white,
                child: InkWell(
                  splashColor: MyColor.yellow_accent,
                  hoverColor: MyColor.yellow_accent,
                  onTap: () {},
                  child: Container(
                    color: model.data.loyaltyPointsFrame == 0
                        ? MyColor.grey_tab
                        : Colors.transparent,
                    padding: EdgeInsets.all(StringFactory.padding4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textCustomNormal(size: 14, text: '$dateDisplay'),
                        textCustomNormalColor(
                            size: 14,
                            fontWeight: model.data.loyaltyPointsFrame > 10000
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: MyColor.black_text,
                            text: model.data.loyaltyPointsFrame == 0
                                ? ''
                                : '${formatNum?.format(model.data.loyaltyPointsFrame)} pts'),
                      ],
                    ),
                  ),
                )));

       
      });
}
