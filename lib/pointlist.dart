import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/model/itemList.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

// ignore: must_be_immutable
class PointList extends StatefulWidget {
  int point;
  PointList({Key? key, required this.point}) : super(key: key);

  @override
  State<PointList> createState() => _PointListState();
}

class _PointListState extends State<PointList> {
  List<ItemList> itemList = [
    ItemList(
        id: 1,
        value: 1000,
        valueString: '1,000',
        range: '10,000 - 19,999 pts',
        range1: 10000,
        range2: 19999),
    ItemList(
        id: 2,
        value: 2000,
        valueString: '2,000',
        range: '20,000 - 29,999 pts',
        range1: 20000,
        range2: 29999),
    ItemList(
        id: 3,
        value: 3000,
        valueString: '3,000',
        range: '30,000 - 49,999 pts',
        range1: 30000,
        range2: 49999),
    ItemList(
        id: 4,
        value: 5000,
        valueString: '5,000',
        range: '50,000 - 69,999 pts',
        range1: 50000,
        range2: 69999),
    ItemList(
        id: 5,
        value: 5000,
        valueString: '7,000',
        range: '70,000 - 99,999 pts',
        range1: 70000,
        range2: 99999),
    ItemList(
        id: 6,
        value: 10000,
        valueString: '10,000',
        range: '100,000 - 149,999 pts',
        range1: 100000,
        range2: 149999),
    ItemList(
        id: 7,
        value: 15000,
        valueString: '15,000',
        range: '150,000 - 199,999 pts',
        range1: 150000,
        range2: 199999),
    ItemList(
        id: 8,
        value: 20000,
        valueString: '20,000',
        range: 'above 200,000 pts',
        range1: 200000,
        range2: 299999),
    ItemList(
        id: 9,
        value: 30000,
        valueString: '30,000',
        range: 'above 300,000 pts',
        range1: 300000,
        range2: 10000000),
  ];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < itemList.length; i++) {
      if (widget.point >= itemList[i].range1 &&
          widget.point <= itemList[i].range2) {
        pointNeed = itemList[i].range2 - widget.point + 1;
      } else {
        if (widget.point == 0) {
          pointNeed = itemList[0].range1;
        } else if (widget.point < itemList[0].range1) {
          pointNeed = itemList[0].range1 - widget.point;
        }
      }
    }
  }

  final formatterNum = NumberFormat();
  late int pointNeed = 0;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width;
    final fullH = MediaQuery.of(context).size.height;
    return Container(
						decoration: BoxDecoration(
							color: MyColor.grey_BG_main,
							borderRadius: BorderRadius.circular(StringFactory.padding)
						),
      width: fullW,
      height: fullH,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCustom(
                size: 16,
                text: 'POINT PYRAMID',
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, color: MyColor.red, size: 28)),
            ],
          ),
          SizedBox(height: StringFactory.padding),
          Container(
            alignment: Alignment.centerLeft,
            child: textCustomNormal(
                size: 14,
                text:"Weekly current point: ${formatterNum.format(widget.point)}.\nNeed more to next prize: $pointNeed"),
          ),
          SizedBox(height: StringFactory.padding),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            reverse: false,
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: StringFactory.padding4,
                        horizontal: StringFactory.padding16),
                    decoration: BoxDecoration(
                      color: comparePoint(widget.point, itemList[index].range1,
                              itemList[index].range2)
                          ? MyColor.yellow2
                          : MyColor.white,
                      borderRadius:
                          BorderRadius.circular(StringFactory.padding4),
                      border: Border.all(color: MyColor.grey_tab, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textCustom(
                            size: 16,
                            text: '${itemList[index].valueString} \$'),
                        textCustomNormal(
                            size: 14, text: '${itemList[index].range}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: StringFactory.padding,
                  ),
                ],
              );
            },
          ),
        ],
      ),

      // Column(
      //   children: [
      //     SizedBox(
      //       width: fullW,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           textCustom(
      //             size: 16,
      //             text: 'POINT PYRAMID',
      //           ),
      //           Positioned(
      //             top: 0,
      //             right: 0,
      //             child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: Icon(Icons.close, color: MyColor.red, size: 28)),
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: StringFactory.padding),
      //     // Container(
      //     //   alignment: Alignment.centerLeft,
      //     //   child: textCustomNormal(
      //     //       size: 12,
      //     //       text:"Your weekly point is ${formatterNum.format(widget.point)}.\nYou need more $pointNeed to get the next price"),
      //     // ),
      //     // SizedBox(height: StringFactory.padding),
      //     ListView.builder(
      //       shrinkWrap: true,
      //       padding: const EdgeInsets.all(0),
      //       reverse: false,
      //       itemCount: itemList.reversed.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Container(
      //           padding: EdgeInsets.symmetric(
      //               vertical: StringFactory.padding4,
      //               horizontal: StringFactory.padding16
      // 										),
      //           decoration: BoxDecoration(
      //             color:
      // 												// comparePoint(widget.point, itemList[index].range1,
      //             //         itemList[index].range2)
      //             //     ? MyColor.bluePink
      //             //     :
      // 																MyColor.white,
      //             border: Border.all(color: MyColor.grey_tab, width: 1),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               textCustom(size: 16, text: '${itemList[index].valueString}\$'),
      //               textCustomNormal(size: 16, text: '${itemList[index].range}'),
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  comparePoint(int point, int range1, int range2) {
    if (point >= range1 && point <= range2) {
      return true;
    } else {
      return false;
    }
  }
}
