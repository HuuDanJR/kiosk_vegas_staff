import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/drawer.dart';
import 'package:vegas_point_portal/model/photoM.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/model/status_range.dart';
import 'package:vegas_point_portal/pointlist.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/debouce.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/shakeText.dart';
import 'package:vegas_point_portal/widget/widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PhotoM> listPhotoM = [];
  final firstDateCalendar = DateTime(2010, 01, 01);
  final lastDateCalendar = DateTime(2030, 01, 01);
  DateTime startDatePicker = DateTime.now();
  DateTime endDatePicker = DateTime.now();
  DateTime startDate = DateTime(2020, 01, 01);
  DateTime endDate = DateTime(2020, 01, 01);
  final formatterNum = NumberFormat();
  final format = StringFormat();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  String? name, tiername, title, email, phone, cardtrack, dateofbirth;
  int? currentPoint,
      totalPoint,
      number,
      dailyPoint,
      monthlyPoint,
      weeklyPoint,
      dailyPointSlot,
      dailyPointRLTB;
  String? id;

  @override
  void initState() {
    super.initState();
    print('INIT STATE HOME ');
  }

  @override
  void dispose() {
    controller.dispose();
    debounce.dispose();
    super.dispose();
  }

  final Debounce debounce = Debounce(const Duration(milliseconds: 500));
  final controller = TextEditingController();
  final controllerStartDate = TextEditingController();
  final controllerEndDate = TextEditingController();
  int pointFrame = -1;
  final service = ServiceAPIs();
  final today = DateTime.now();
  Timer? timer;

  Status model = Status(
      status: false,
      data: Data(
          email: '',
          phone: '',
          tiername: '',
          dateofbirth: '',
          title: '',
          preferredName: '',
          number: 0,
          loyaltyPoints: 0,
          loyaltyPointsToday: 0,
          loyaltyPointTodaySlot: 0,
          loyaltyPointTodayRLTB: 0,
          loyaltyPointsCurrent: 0,
          loyaltyPointsWeek: 0,
          loyaltyPointsMonth: 0));

  Future _selectDate({
    required BuildContext context,
    functionCancel,
  }) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: MyColor.yellow_accent, // header background color
                onPrimary: Colors.black, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(today.year, 1, 1),
        lastDate: DateTime(today.year, 12, 31));
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    } else {
      functionCancel!();
    }
  }

  Future _selectDate2({
    required BuildContext context,
    Function? functionCancel,
  }) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: MyColor.yellow_accent, // header background color
                onPrimary: MyColor.white, // header text color
                onSurface: MyColor.black_text, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: MyColor.black_text, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(today.year, 1, 1),
        lastDate: DateTime(today.year, 12, 31));

    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    } else {
      functionCancel!();
      // print('run cancel 2');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width_container = kIsWeb ? width * 4 / 5 - (32) : width;
    final width_web = kIsWeb ? width * 3.75 / 5 : width;
    const paddingValue = 16.0;
    return Scaffold(
      drawer: MyDrawer(
        level: tiername,
        current_point: currentPoint.toString(),
        total_point: totalPoint.toString(),
        name: name,
        title: title,
        number: number.toString(),
      ),
      key: _key,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingValue * 2, vertical: paddingValue),
              alignment: Alignment.center,
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      filterQuality: FilterQuality.low,
                      image: AssetImage('images/point_portal_background2.jpeg'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width_web,
                      alignment: Alignment.center,
                      child:
                          // textAnimation(
                          //   text: 'SELF CHECK POINT KIOSK',
                          //   colorizeColors: colorizeColors,
                          //   colorizeTextStyle: colorizeTextStyle,
                          // ),
                          textCustom(
                        size: 26,
                        text: 'SELF CHECK POINT KIOSK',
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: width_web,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildRow2(
                              text: 'dear mr/mdm:',
                              value: name,
                              width: width_web * 1.95 / 4),
                          buildRow2Container(
                              width: width_web * 1.95 / 4,
                              children: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      textCustomGrey(text: "CN: ", size: 22),
                                      textCustom(
                                          text: number == 0
                                              ? ''
                                              : number.toString(),
                                          size: 22),
                                      // textCustom(text:'1122334455',size:22)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      textCustomGrey(text: "BOD: ", size: 22),
                                      textCustom(text: dateofbirth, size: 22),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: width_web,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildRow2(
                              text: 'current point:',
                              value: currentPoint == 0
                                  ? 0
                                  : formatterNum.format(currentPoint),
                              width: width_web * 1.95 / 4),
                          buildRow2Container(
                              width: width_web * 1.95 / 4,
                              children: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      textCustomGrey(text: "daily: ", size: 22),
                                      textCustom(
                                          text: dailyPoint == 0
                                              ? '0'
                                              : '${formatterNum.format(dailyPoint)}',
                                          size: 22),
                                      // textCustom(text:'1122334455',size:22)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      textCustomGrey(text: "Slot: ", size: 22),
                                      textCustom(
                                          text: dailyPointSlot == 0
                                              ? '0'
                                              : '${formatterNum.format(dailyPointSlot)}',
                                          size: 22),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      textCustomGrey(
                                          text: "RL & TB: ", size: 22),
                                      textCustom(
                                          text: dailyPointRLTB == 0
                                              ? '0'
                                              : '${formatterNum.format(dailyPointRLTB)}',
                                          size: 22),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    //DAILY POINT
                    SizedBox(
                      width: width_web,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildRow2(
                              hasIcon: true,
                              onPressed: () {
                                // timer!.cancel();
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => Dialog(
                                //           child: Container(
																																// 											height: height/2,
																																// 											width:width,
                                //             child: PointList(
                                //                 point: weeklyPoint!,
                                //                 ),
                                //           ),
                                //         ));
                                // cancelTimer();
                              },
                              text: 'weekly point:',
                              value: weeklyPoint == 0
                                  ? 0
                                  : formatterNum.format(weeklyPoint),
                              width: width_web * 1.95 / 4),
                          buildRow2(
                              text: 'monthly point',
                              value: monthlyPoint == 0
                                  ? 0
                                  : formatterNum.format(monthlyPoint),
                              width: width_web * 1.95 / 4),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: width_web,
                      alignment: Alignment.center,
                      child: textCustom(
                        size: 26,
                        text: 'CUSTOM CHECK',
                      ),
                      // textAnimation(
                      //   text: 'CUSTOM CHECK',
                      //   colorizeColors: colorizeColors,
                      //   colorizeTextStyle: colorizeTextStyle,
                      // ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: width_web,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: width_web * 1.95 / 4,
                              color: Colors.white,
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textCustom(
                                      text: format.formatDate(startDate) == "2020-01-01"
                                          ? 'from:'
                                          : 'from: ${format.formatDate(startDate)}',
                                      size: 18),
                                  IconButton(
                                      onPressed: () {
                                        _selectDate(
                                                context: context,
                                                functionCancel: () {}).then((value) {
                                          final int result = getFramePoint();
                                          if (result != -1) {
                                            shakeKey.currentState?.shake();
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.calendar_month))
                                ],
                              )),
                          Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(left: 10),
                              width: width_web * 1.95 / 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textCustom(
                                      text: format.formatDate(endDate) ==
                                              "2020-01-01"
                                          ? 'to:'
                                          : 'to: ${format.formatDate(endDate)}',
                                      size: 18),
                                  IconButton(
                                      onPressed: () {
                                        debugPrint('click select date 2');
                                        _selectDate2(
                                                context: context,
                                                functionCancel: () {}).then((value) {
                                          final int result = getFramePoint();
                                          if (result != -1) {
                                            shakeKey.currentState?.shake();
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.calendar_month))
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    buildRow2WithShakeText(
                        shakeKey: shakeKey,
                        text: 'frame point:',
                        value: pointFrame == -1
                            ? ""
                            : pointFrame == 0
                                ? 0
                                : formatterNum.format(pointFrame),
                        width: width_web * 1.95 / 4),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: width_web,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).popAndPushNamed('/welcome');
                              },
                              child: Row(
                                children: [
                                  textCustomGrey(
                                      text: 'Back to home'.toLowerCase(),
                                      size: 16),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.exit_to_app,
                                      size: 34, color: Colors.black87),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: StringFactory.padding,
              left: StringFactory.padding,
              child: IconButton(
                  onPressed: () {
                    debugPrint('click drawer');
                    _key.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: MyColor.black_text,
                    size: 34,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  getFramePoint() {
    debugPrint('my trackdata: $cardtrack');
    final isBefore = startDate.isBefore(endDate);
    final isEqual = startDate.isAtSameMomentAs(endDate);
    if (startDate == endDate ||
        startDate == DateTime(2020, 01, 01) ||
        endDate == DateTime(2020, 01, 01)) {
      // showToast('please select dates'.toUpperCase());
      setState(() {
        pointFrame = -1;
      });
    } else {
      if (isEqual == false || isBefore == true) {
        service.postPointCardTrackRange(
                id: cardtrack,
                startDate: format.formatDate(startDate),
                endDate: format.formatDate(endDate))
            .then((value) {
          print(value);
          StatusRange model = value;
          setState(() {
            pointFrame = model.data.loyaltyPointsFrame;
          });
        });
      }
      if (isEqual == true || isBefore == false) {
        service.postPointCardTrackRange(
                id: cardtrack,
                startDate: format.formatDate(startDate),
                endDate: format.formatDate(endDate))
            .then((value) {
          StatusRange model = value;
          setState(() {
            pointFrame = model.data.loyaltyPointsFrame;
          });
        });
      }
      if (isEqual == false && isBefore == false) {
        debugPrint('is before <');
        setState(() {
          pointFrame = -1;
        });
        // showToast('please choose date start < date end'.toUpperCase());
      }
    }
    return pointFrame;
  }
}
