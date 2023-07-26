import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';

final service = ServiceAPIs();
Widget itemListUser(
    {width,
    name,
    number,
    onPress,
    color,
    String? level,
    isMCPlayer = false,
    datetime = '',
    point = '',
    moreInfor = false,
    activeState = false}) {
  return Container(
			decoration: BoxDecoration(
				border: Border.all(color:activeState==true? Colors.green : Colors.transparent)
			),
    child: Material(
      color: MyColor.grey_tab2,
      child: InkWell(
        splashColor: MyColor.grey_tab,
        hoverColor: MyColor.grey_tab,
        onTap: () {
          onPress();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 85,
              height: 85,
              child: FutureBuilder(
                  future: service.postCustomerImage(
                      customerNumber: number,
                      computerName: StringFactory.COMPUTERNAME),
                  builder: (context, snapshot) {
                    late String model = snapshot.data as String;
                    Uint8List _bytesImage =
                        const Base64Decoder().convert(snapshot.data.toString());
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return myprogress_circular();
                    }
                    if (snapshot.data == 'null') {
                      return Center(
                          child: Icon(Icons.person, color: MyColor.grey));
                    }
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(StringFactory.padding4),
                      child: Image.memory(
                        _bytesImage,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            Text(number,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: StringFactory.mainFont,
                    color: MyColor.black_text,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            Text(name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: StringFactory.mainFont,
                    color: MyColor.black_text,
                    fontSize: 11,
                    fontWeight: FontWeight.normal)),
            isMCPlayer
                ? Text(datetime,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: StringFactory.mainFont,
                        color: MyColor.black_text,
                        fontSize: 11,
                        fontWeight: FontWeight.normal))
                : moreInfor = true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(level!,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontFamily: StringFactory.mainFont,
                                  color: level == StringFactory.level_oneplus
                                      ? MyColor.red_accent
                                      : level == StringFactory.levelone
                                          ? MyColor.red
                                          : level == StringFactory.levelv
                                              ? MyColor.yellow3
                                              : level == StringFactory.leveli
                                                  ? MyColor.black_text
                                                  : MyColor.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          Text(point,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontFamily: StringFactory.mainFont,
                                  color: MyColor.black_text,
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal)),
                        ],
                      )
                    : Container()
          ],
        ),
      ),
    ),
  );
}

Widget itemList({width, name, number, onPress, color}) {
  return Container(
    padding: EdgeInsets.all(StringFactory.padding),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: color),
      ),
    ),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
                width: 100,
                child: Text(number,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: StringFactory.mainFont,
                        color: MyColor.black_text,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
            SizedBox(width: StringFactory.padding),
            Text(name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: StringFactory.mainFont,
                    color: MyColor.black_text,
                    fontSize: 14,
                    fontWeight: FontWeight.normal))
          ],
        ),
        TextButton(
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  onPress();
                },
                icon: const Icon(Icons.arrow_forward_ios)))
      ],
    ),
  );
}
