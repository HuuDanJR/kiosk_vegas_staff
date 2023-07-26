import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/status_range.dart';
import 'package:vegas_point_portal/pointlistinmonth.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/date_process.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/voucherspage.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/itemListViewPoint.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/widget.dart';

// ignore: must_be_immutable
class PointFrameList extends StatefulWidget {
  int point;
  String? number;

  String dates;
  PointFrameList(
      {Key? key,
      required this.point,
      required this.dates,
      required this.number})
      : super(key: key);

  @override
  State<PointFrameList> createState() => _PointFrameListState();
}

class _PointFrameListState extends State<PointFrameList> {
  List<String> listDate = [];
  List<String> listDateMonth = [];
  final serviceAPIs = ServiceAPIs();
  final stringFormat = StringFormat();
  final formatNum = NumberFormat();
  final myCtl = Get.put(MyGetXController());
  @override
  void initState() {
    super.initState();
    // convert dates
    listDate = widget.dates.split(' -- ');
    //end here

    listDateMonth = get3MonthPreriod(
      listDate[0],
    );
    listDateMonth.insert(0, listDate[0]);

    print('widget point: ${widget.point}');
    if (widget.point == null || widget.point == 0 || widget.point == -1) {
      print('null value ');
    }

    print('INIT POINT FRAME LIST ${myCtl.userFrameP}');
  }

  final formatterNum = NumberFormat();
  late int pointNeed = 0;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width;
    final fullH = MediaQuery.of(context).size.height;
    return Container(
      width: fullW,
      height: fullH,
      decoration: BoxDecoration(
							color: MyColor.grey_BG_main,
							borderRadius: BorderRadius.circular(StringFactory.padding16)
						),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCustom(
                size: 16,
                text: 'FRAME POINT MAP',
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, color: MyColor.red, size: 28)),
            ],
          ),
          SizedBox(height: StringFactory.padding16),
          itemPointList(
              formatNum: formatNum,
              hasBorder: true,
              dates: widget.dates,
              point: widget.point,
              title: 'Frame Date'),
          SizedBox(height: StringFactory.padding16),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return itemPointListWFutureB(
                  hasIcon: true,
                  onPressIcon: () {
                    print('object click item $index');
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
																														backgroundColor: MyColor.grey_BG_main,
                              content: SizedBox(
                              width: fullW * 2 / 3,
                              height: fullH * 2 / 3,
                              child: PointInMonth(
                                  number: widget.number!,
                                  listDate: getDaysInBetween(
                                      format.stringToDate(listDateMonth[index]),
                                      format.stringToDate(
                                          listDateMonth[index + 1]))),
                            )));
                  },
                  formatNum: formatNum,
                  serviceAPIs: serviceAPIs,
                  number: widget.number,
                  startDate: listDateMonth[index],
                  endDate: listDateMonth[index + 1],
                  title: index == 0
                      ? '1st Month'
                      : index == 1
                          ? '2nd Month'
                          : index == 2
                              ? '3rd Month'
                              : 'Months');
            },
          ),

          // SizedBox(height: StringFactory.padding16),
          // itemPointListWFutureB(
          //     formatNum: formatNum,
          //     serviceAPIs: serviceAPIs,
          //     number: widget.number,
          //     startDate: listDateMonth[0],
          //     endDate: listDateMonth[1],
          //     title: '2nd Month'),
          // SizedBox(height: StringFactory.padding16),
          // itemPointListWFutureB(
          //     formatNum: formatNum,
          //     serviceAPIs: serviceAPIs,
          //     number: widget.number,
          //     startDate: listDateMonth[1],
          //     endDate: listDateMonth[2],
          //     title: '3rd Month'),
        ],
      ),
    );
  }
}

Widget itemPointListWFutureB(
    {ServiceAPIs? serviceAPIs,
    startDate,
    hasIcon,
    endDate,
    onPressIcon,
    number,
    title,
    NumberFormat? formatNum}) {
  return FutureBuilder(
    future: serviceAPIs!.postPointNumberRange(
      startDate: startDate,
      endDate: endDate,
      number: number,
    ),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      late final StatusRange model = snapshot.data;
      if (snapshot.connectionState == ConnectionState.waiting) {
        return myprogress_circular();
      }
      return Column(
        children: [
          itemPointList(
              hasIcon: model.data.loyaltyPointsFrame == 0 ? !hasIcon : hasIcon,
              onPressIcon: onPressIcon,
              formatNum: formatNum,
              dates: '$startDate|$endDate',
              point: model.data.loyaltyPointsFrame,
              title: '$title'),
          SizedBox(
            height: StringFactory.padding16,
          )
        ],
      );
    },
  );
}



get3MonthPreriod(
  value,
) {
  final DateTime date = format.stringToDate(value);
  final newDate1month = DateTime(date.year, date.month + 1, date.day);
  final newDate2month = DateTime(date.year, date.month + 2, date.day);
  final newDate3month = DateTime(date.year, date.month + 3, date.day);
  final List<String> list = [];

  list.add(format.formatDate(newDate1month));
  list.add(format.formatDate(newDate2month));
  list.add(format.formatDate(newDate3month));

  print(list.toString());
  return list;
}

Widget itemPointList(
    {dates,
    onPressIcon,
    int? point,
    title,
    hasIcon = false,
    bool hasBorder = false,
    NumberFormat? formatNum}) {
  return Container(
    decoration: BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.circular(StringFactory.padding4),
        border: Border.all(
            width: 2,
            color:
                hasBorder == true ? MyColor.yellow_accent : MyColor.grey_tab)),
    padding: EdgeInsets.all(StringFactory.padding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textCustom(text: '$title'),
            Text(
              '$dates',
              style: TextStyle(fontSize: 12, color: MyColor.black_text),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            textCustom(text: '${formatNum!.format((point))} pts'),
            SizedBox(
              width: StringFactory.padding,
            ),
            hasIcon == true
                ? InkWell(
                    onTap: onPressIcon,
                    child: Container(
                        padding: EdgeInsets.all(StringFactory.padding4),
                        decoration: BoxDecoration(
                          color: MyColor.yellow,
                          borderRadius:
                              BorderRadius.circular(StringFactory.padding4),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: MyColor.black_text,
                          size: 16,
                        )),
                  )
                : Container(
                    width: 0,
                  )
          ],
        )
      ],
    ),
  );
}
