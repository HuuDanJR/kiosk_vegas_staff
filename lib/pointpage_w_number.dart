import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/model/status_range.dart';
import 'package:vegas_point_portal/model/user.dart';
import 'package:vegas_point_portal/pointFrameList.dart';
import 'package:vegas_point_portal/pointlist.dart';
import 'package:vegas_point_portal/searchpagecontainer.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/date_process.dart';
import 'package:vegas_point_portal/util/detect_platform.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vegas_point_portal/widget/bodyPoint.dart';
import 'package:vegas_point_portal/widget/shakeText.dart';
import 'package:vegas_point_portal/widget/widget.dart';
import 'widget/mysnackbar.dart';
import 'widget/searchField.dart';

class PointPageWithNumber extends StatefulWidget {
  bool hasLeading = false;
  PointPageWithNumber({Key? key, required this.hasLeading}) : super(key: key);
  @override
  State<PointPageWithNumber> createState() => _PointPageWithNumberState();
}

class _PointPageWithNumberState extends State<PointPageWithNumber> {
  var focusNode = FocusNode();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final formatNum = NumberFormat();
  final searchInputController = TextEditingController();

  final controllerNumber = TextEditingController();
  DateTime startDate = DateTime(2020, 01, 01);
  DateTime endDate = DateTime(2020, 01, 01);
  final service = ServiceAPIs();
  String name = '';
  String dateofbirth = '';
  String number = '';
  String point_current = '';
  String point_weekly = '';
  String point_monthly = '';
  String point_daily = '';
  String point_slot = '';
  String point_rl_tb = '';
  int point_frame = -1;
  int point_custom = -1;

  String dateFrame = '';
  String cardtrack = '';
  String tierName = '';
  final myCtl = Get.put(MyGetXController());

  final format = StringFormat();
  final today = DateTime.now();
  bool isSearch = false;

  //BOX STORAGE
  runApi({value, MyGetXController? controller}) {
    service.getCardTrackByNumber(number: value).then((value) {
      final String mycardtrackdata = value[0]['TrackData'].toString();
      if (value.length > 0) {
        service
            .postPointCardTrack(
              id: mycardtrackdata,
              today: format.formatDate(today),
              today2: format.formatDate(getTomorrow(today)),
              startWeek: getDateWeek(today)[0],
              endWeek: getDateWeek(today)[1],
              startMonth: getDateMonth(today)[0],
              endMonth: getDateMonth(today)[1],
            )
            .whenComplete(() {})
            .onError((error, stackTrace) => debugPrint(error.toString()))
            .then((value) {
          final Status model = value;
          if (model.status == true) {
            ScaffoldMessenger.of(context)
                .showSnackBar(mysnackBar('Found Data Successfully'));
            setState(() {
              name = model.data.preferredName;
              dateofbirth =
                  format.formatDate(DateTime.parse(model.data.dateofbirth));
              number = model.data.number.toString();
              tierName = model.data.tiername;
              point_current = model.data.loyaltyPointsCurrent.toString();
              point_daily = model.data.loyaltyPointsToday.toString();
              point_weekly = model.data.loyaltyPointsWeek.toString();
              point_monthly = model.data.loyaltyPointsMonth.toString();
              point_slot = model.data.loyaltyPointTodaySlot.toString();
              point_rl_tb = model.data.loyaltyPointTodayRLTB.toString();
              cardtrack = mycardtrackdata;
              point_frame = -1;
              point_custom = -1;
              startDate = DateTime(2020, 01, 01);
              endDate = DateTime(2020, 01, 01);
            });

            //FIND POINT FRAME
            service.findDateFrameByNumber(number).then((value) {
              if (value.list.first.frameEndDate == DateTime(2000, 01, 01) &&
                  value.list.first.frameStartDate == DateTime(2000, 01, 01)) {
                setState(() {
                  dateFrame = '';
                  point_frame = -1;
                });
              } else if (value.list.first.frameEndDate != null &&
                  value.list.first.frameStartDate != null) {
                setState(() {
                  dateFrame =
                      '${format.formatDate(value.list.first.frameStartDate)} --  ${format.formatDate(value.list.first.frameEndDate)}';
                });
                service
                    .postPointCardNumber(
                        number: number,
                        startDate:
                            format.formatDate(value.list.first.frameStartDate),
                        endDate:
                            format.formatDate(value.list.first.frameEndDate))
                    .then((value) {
                  setState(() {
                    point_frame = value.data.loyaltyPointsFrame;
                  });
                });
              }
            });

            //END HERE
            controller!.saveUserDataWithNumber(User(
              name: model.data.preferredName,
              number: model.data.number,
              dateofbirth:
                  format.formatDate(DateTime.parse(model.data.dateofbirth)),
              currentPoint: model.data.loyaltyPointsCurrent,
              dailyPoint: model.data.loyaltyPointsToday,
              dailyPointRl: model.data.loyaltyPointTodayRLTB,
              dailyPointSl: model.data.loyaltyPointTodaySlot,
              weeklyPoint: model.data.loyaltyPointsWeek,
              monthlyPoint: model.data.loyaltyPointsMonth,
              cardtrack: mycardtrackdata,
														tiername: model.data.tiername,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(mysnackBar('No Data'));
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(mysnackBar('No Data'));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('value number save : ${myCtl.userNumberSave.value}');
      print('point number stsatus : ${myCtl.hasChangePointWNumberPage.value}');
      print('has move to vouchers : ${myCtl.hasMoveToVouchers.value}');
      if (myCtl.hasChangePointWNumberPage.value == true) {
        runApi(controller: myCtl, value: myCtl.userNumberSave.value);
      }
    });
  }

  @override
  void dispose() {
    controllerNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = MediaQuery.of(context).size.width * 1.7 / 4;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, //change your color here
            ),
            centerTitle: true,
            leading: widget.hasLeading == true
                ? IconButton(
                    onPressed: () {
                      myCtl.backToPage();
                      myCtl.turnOffPointNumberStatus();
                    },
                    icon: const Icon(Icons.arrow_back_ios))
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            actions: [
              widget.hasLeading == false
                  ? IconButton(
                      onPressed: () {
                        if (myCtl.isSearchVoucherInput.value == false) {
                          myCtl.turnOnVoucherSearchInput();
                        } else {
                          myCtl.turnOffVoucherSearchInput();
                        }
                      },
                      icon: const Icon(Icons.search))
                  : SizedBox(width: 0, height: 0)
            ],
            title: GetBuilder<MyGetXController>(
              builder: (controller) => textCustomNormalColorFont(
                  color: MyColor.white, size: 18, text: 'Points'),
            )),
        body: Container(
            color: MyColor.grey_BG_main,
            height: height,
            padding: EdgeInsets.symmetric(
                horizontal: StringFactory.padding32,
                vertical: StringFactory.padding16),
            width: width,
            child: GetBuilder<MyGetXController>(
              builder: (myCtl) => myCtl.userNameWNumber.value == ''
                  ? const Center(
                      child: Text(
                      'Enter Customer Number',
                      textAlign: TextAlign.center,
                    ))
                  : bodyPoint(
                      dateFrame: dateFrame,
                      height: height,tierName: tierName == ''
                              ? '${myCtl.userTierWNumber.value}'
                              : tierName,
                      width: width,
                      formatNum: formatNum,
                      context: context,
                      dateofbirth: dateofbirth == ''
                          ? '${myCtl.userDateOfBirthWNumber.value}'
                          : dateofbirth,
                      format: format,
                      itemWidth:detectPlatform() == false? itemWidth : width  ,
                      name:
                          name == '' ? '${myCtl.userNameWNumber.value}' : name,
                      number: number == ''
                          ? '${myCtl.userNumberWNumber.value}'
                          : number,
                      point_current: point_current == ''
                          ? '${myCtl.userCurrentPWNumber.value}'
                          : point_current,
                      point_daily: point_daily == ''
                          ? '${myCtl.userDailyPWNumber.value}'
                          : point_daily,
                      point_monthly: point_monthly == ''
                          ? '${myCtl.userMonthlyPWNumber.value}'
                          : point_monthly,
                      point_rl_tb: point_rl_tb == ''
                          ? '${myCtl.userDailyPRL_TBWNumber.value}'
                          : point_rl_tb,
                      point_slot: point_slot == ''
                          ? '${myCtl.userDailyPSLWNumber.value}'
                          : point_slot,
                      point_weekly: point_weekly == ''
                          ? '${myCtl.userWeeklyPWNumber.value}'
                          : point_weekly,
                      point_custom: point_custom,
                      shakeKey: shakeKey,
                      point_frame: point_frame,
                      startDate: startDate,
                      endDate: endDate,
                      onPressDialogFrame: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: width * 2 / 3,
                                    height: height * 2 / 3,
                                    child: PointFrameList(
                                        number: number,
                                        dates: dateFrame,
                                        point: (point_frame)),
                                  ),
                                ));
                      },
                      onPressDialog: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: width * 2 / 3,
                                    height: height * 2 / 3,
                                    child: PointList(
                                        point: point_weekly == ''
                                            ? myCtl.userWeeklyPWNumber.value
                                            : int.parse(point_weekly)),
                                  ),
                                ));
                      },
                      date1Func: (value) {
                        print('object $value');
                        setState(() {
                          startDate = value;
                        });
                        point_frame = getFramePoint();
                        if (point_frame != -1) {
                          shakeKey.currentState?.shake();
                        }
                      },
                      date2Func: (value) {
                        print('object 2$value');
                        setState(() {
                          endDate = value;
                        });
                        point_frame = getFramePoint();
                        if (point_frame != -1) {
                          shakeKey.currentState?.shake();
                        }
                      }),
            )));
  }

  getFramePoint() {
    debugPrint('my trackdata save: ${myCtl.userCardtrack}');
    final isBefore = startDate.isBefore(endDate);
    final isEqual = startDate.isAtSameMomentAs(endDate);
    if (startDate == endDate ||
        startDate == DateTime(2020, 01, 01) ||
        endDate == DateTime(2020, 01, 01)) {
      // showToast('please select dates'.toUpperCase());
      setState(() {
        point_custom = -1;
      });
    } else {
      if (isEqual == false || isBefore == true) {
        service
            .postPointCardTrackRange(
                id: cardtrack == '' ? myCtl.userCardtrack.value : cardtrack,
                startDate: format.formatDate(startDate),
                endDate: format.formatDate(endDate))
            .then((value) {
          print(value);
          StatusRange model = value;
          setState(() {
            point_custom = model.data.loyaltyPointsFrame;
          });
        });
      }
      if (isEqual == true || isBefore == false) {
        service
            .postPointCardTrackRange(
                // id: cardtrack,
                id: cardtrack == '' ? myCtl.userCardtrack.value : cardtrack,
                startDate: format.formatDate(startDate),
                endDate: format.formatDate(endDate))
            .then((value) {
          StatusRange model = value;
          setState(() {
            point_custom = model.data.loyaltyPointsFrame;
          });
        });
      }
      if (isEqual == false && isBefore == false) {
        debugPrint('is before <');
        setState(() {
          point_custom = -1;
        });
        // showToast('please choose date start < date end'.toUpperCase());
      }
    }
    return point_custom;
  }
}
