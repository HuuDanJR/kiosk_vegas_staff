import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/customer.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/model/user.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/date_process.dart';
import 'package:vegas_point_portal/util/debouce.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/screen_detect.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/welcome.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class SearchCustomerPage extends StatefulWidget {
  SearchCustomerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchCustomerPage> createState() => _SearchCustomerPageState();
}

class _SearchCustomerPageState extends State<SearchCustomerPage> {
  final format = StringFormat();
  final today = DateTime.now();

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
  final controller = TextEditingController();
  final service = ServiceAPIs();
  final Debounce debounce = Debounce(Duration(milliseconds: 500));

  String? keyword = '';

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
    final height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          color: MyColor.white,
          // borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(
            top: StringFactory.padding16,
            left: StringFactory.padding16,
            right: StringFactory.padding16),
        width: width,
        height: height,
        child: Column(
          children: [
            textinputCustom(
                hasborder: false,
                textAlign: TextAlign.left,
                hintValue: 'enter customer name',
                W: width,
                controller: controller,
                enable: true,
                fontSize: 14,
                hasCloseIcon: true,
                onchange: (String value) {
                  debounce(() {
                    // debugPrint(value);
                    setState(() {
                      keyword = value;
                    });
                  });
                },
                onSubmitFunc: (value) {
                  setState(() {
                    keyword = value;
                  });
                }),
            SizedBox(
              height: StringFactory.padding,
            ),
            Expanded(
                child: FutureBuilder(
              future: service.searchCustomerName(keyword: '$keyword'),
              builder: ((context, snapshot) {
                late final list_customer = snapshot.data as CustomerList;
                if (snapshot.hasError) {
                  return Center(
                    child: textCustomNormalColorFont(
                      color: MyColor.black_text,
                      font: StringFactory.mainFont,
                      size: 14,
                      text: 'use customer name keyword',
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: MyColor.yellow,
                    strokeWidth: 1.5,
                    backgroundColor: Colors.grey,
                  ));
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: detectScreenWidth(context:context,width: MediaQuery.of(context).size.width),
                    childAspectRatio: StringFactory.aspectRatio,
                    crossAxisSpacing: StringFactory.padding,
                    mainAxisSpacing: StringFactory.padding,
                  ),
                  itemCount: list_customer.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemListUser(
                        isMCPlayer: false,
                        level: '',
                        point: '',
                        moreInfor: false,
                        onPress: () {
                          debugPrint('click search');
                          final myCtl = Get.put(MyGetXController());
                          myCtl.moveToVoucher(list_customer.list[index].number.toString());
                          myCtl.turnOnPointNumberStatus();
                        },
                        width: width,
                        number: '${list_customer.list[index].number}',
                        color: list_customer.list[index].gender == 2
                            ? MyColor.grey
                            : MyColor.grey_tab,
                        name: list_customer.list[index].preferredName);
                  },
                );
              }),
            ))
          ],
        ));
  }
}
