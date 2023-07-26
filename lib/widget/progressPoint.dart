import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/dateframedata.dart';
import 'package:vegas_point_portal/pointlist.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/datePick.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class ProgressPoint extends StatefulWidget {
  double width;
  int? point_frame;
  ProgressPoint({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<ProgressPoint> createState() => _ProgressPointState();
}

class _ProgressPointState extends State<ProgressPoint> {
  List<PointTier> list_point = [
    PointTier(min: 0, valueStr: '0', name: 'P', max: 19999),
    PointTier(min: 20000, valueStr: '20,000', name: 'I', max: 99999),
    PointTier(min: 100000, valueStr: '100,000', name: 'V', max: 319999),
    PointTier(min: 320000, valueStr: '320,000', name: 'One', max: 999999),
    PointTier(min: 1000000, valueStr: '1,000,000', name: 'One+', max: 3000000),
  ];
  int maxPoint = 0;
  int point_frame = 29999;
  int? pointLeft;
  String? level;
  String? levelNext;
  final formatNum = NumberFormat();
  final myCtl = Get.put(MyGetXController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
    print('INIT STATE PROGRESS POINT ${point_frame}');
    super.initState();
    for (var i = 0; i < list_point.length; i++) {
      if (point_frame >= list_point[i].min! &&
          point_frame <= list_point[i].max!) {
        setState(() {
          level = list_point[i].name;
          levelNext = list_point[i + 1].name;
          pointLeft = list_point[i].max! - point_frame + 1;
          maxPoint = list_point[i].max!;
        });

        print('$level $levelNext');
      }
      // print(list_point[i].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
				// GetBuilder<MyGetXController>(builder: (controller) => Text('${controller.userFrameP.value}'),);
				Container(
        width: widget.width,
        // padding: EdgeInsets.all(StringFactory.padding),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(StringFactory.padding4),
          // border: Border.all(
          //   color: MyColor.grey_tab,
          //   width: 1,
          // ),
          color: MyColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textCustomGrey(
                    text: 'Point to next level ($levelNext):  ', size: 16),
                textCustom(
                  text: '${formatNum.format(pointLeft)}',
                  size: 16,
                ),
              ],
            ),
            SizedBox(
              height: StringFactory.padding,
            ),
            // Text('Your current level: $level'),
            // SizedBox(
            //   height: StringFactory.padding4,
            // ),
            LinearPercentIndicator(
              backgroundColor: MyColor.grey_tab,
              width: widget.width,
              padding: EdgeInsets.all(0),
              animation: true,
              lineHeight: StringFactory.padding16,
              // barRadius: Radius.circular(StringFactory.padding4),
              curve: Curves.linear,
              widgetIndicator: textCustom(
                  text: '${formatNum.format(point_frame)}', size: 11),
              alignment: MainAxisAlignment.start,
              percent: (point_frame / (maxPoint)).abs(),
              progressColor: MyColor.yellow2,
            ),
          ],
        ));
  }
}

class PointTier {
  int? min;
  int? max;
  String? valueStr;
  String? name;
  PointTier(
      {required this.min,
      required this.max,
      required this.valueStr,
      required this.name});
}
