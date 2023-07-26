import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/machine_player.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/model/user.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/date_process.dart';
import 'package:vegas_point_portal/util/debouce.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/screen_detect.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/datePick.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/widget.dart';
import 'dart:typed_data';

class MachinePlayerPage extends StatefulWidget {
  MachinePlayerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MachinePlayerPage> createState() => _MachinePlayerPageState();
}

class _MachinePlayerPageState extends State<MachinePlayerPage> {
  final format = StringFormat();
  final today = DateTime.now();
  DateTime datePicked = DateTime.now();
  DateTime gammingDate = DateTime.now();
  final controller = TextEditingController();
  final service = ServiceAPIs();
  final Debounce debounce = Debounce(const Duration(milliseconds: 500));
  String? keyword;

  Status model = Status(
      status: false,
      data: Data(
          email: '',
          phone: '',
          tiername: '',
          title: '',
          dateofbirth: '',
          preferredName: '',
          number: 0,
          loyaltyPoints: 0,
          loyaltyPointsToday: 0,
          loyaltyPointTodaySlot: 0,
          loyaltyPointTodayRLTB: 0,
          loyaltyPointsCurrent: 0,
          loyaltyPointsWeek: 0,
          loyaltyPointsMonth: 0));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    final width_full = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          color: MyColor.white,
        ),
        padding: EdgeInsets.only(
            top: StringFactory.padding16,
            left: StringFactory.padding16,
            right: StringFactory.padding16),
        width: width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              width: width_full,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textinputCustom(
                      hasborder: true,
                      textAlign: TextAlign.left,
                      hintValue: 'enter machine number ',
                      W: width,
                      controller: controller,
                      enable: true,
                      fontSize: 14,
                      hasCloseIcon: true,
                      onchange: (String value) {
                        debounce(() {
                          // setState(() {
                          //   keyword = value;
                          // });
                          // debugPrint('keyword: $keyword');
                        });
                      },
                      onSubmitFunc: (value) {
                        setState(() {
                          keyword = value;
                        });
                        debugPrint('keyword sub: $keyword');
                      }),
                  SizedBox(width: StringFactory.padding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            selectDate(context: context).then((value) {
                              setState(() {
                                datePicked = value;
                              });
                            });
                          },
                          child: Icon(Icons.calendar_month_rounded,
                              color: MyColor.black_text)),
                      textCustomNormalColorFont(
                        color: MyColor.black_text,
                        font: StringFactory.mainFont,
                        size: 12,
                        text: format.formatDate(datePicked),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: StringFactory.padding,
            ),
            Expanded(
                child: FutureBuilder(
              future: service.postMachinePlayerByMCNumber(
                  machinenumber: '$keyword',
                  gammingDate: format.formatDate(datePicked)),
              builder: ((context, snapshot) {
                late final modelMC = snapshot.data as MachinePlayer;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return myprogress_circular();
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(
                    child: textCustomNormalColorFont(
                      color: MyColor.black_text,
                      font: StringFactory.mainFont,
                      size: 14,
                      text: 'use machine number',
                    ),
                  );
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: detectScreenWidth(context:context,width: MediaQuery.of(context).size.width),
                    childAspectRatio: StringFactory.aspectRatio,
                    crossAxisSpacing: StringFactory.padding,
                    mainAxisSpacing: StringFactory.padding,
                  ),
                  itemCount: modelMC.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemListUser(
                        isMCPlayer: true,
                        onPress: () {
                          debugPrint('click');
                          final myCtl = Get.put(MyGetXController());
                          myCtl.moveToVoucher(modelMC.data[index].customerNumber.toString());
                          myCtl.turnOnPointNumberStatus();
                        },
                        activeState: modelMC.data[index].endDateTime == null
                            ? true
                            : false,
                        datetime: modelMC.data[index].endDateTime == null
                            ? '${format.formatTimeHHMM(modelMC.data[index].startDateTime)}-PLAYING'
                            : '${format.formatTimeHHMM(modelMC.data[index].startDateTime)}-${format.formatTimeHHMM(modelMC.data[index].endDateTime)}',
                        width: width,
                        number: '${modelMC.data[index].customerNumber}',
                        name: 'MC: ${modelMC.data[index].machineNumber}');
                  },
                );
              }),
            ))
          ],
        ));
  }
}
