import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/customerframe.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/itemListUser.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class ListSuggestPage extends StatefulWidget {
  ListSuggestPage({Key? key}) : super(key: key);

  @override
  State<ListSuggestPage> createState() => _ListSuggestPageState();
}

class _ListSuggestPageState extends State<ListSuggestPage> {
  final service_api = ServiceAPIs();
  String? name;
  String? number = '';
  bool isSearch = false;
  final searchInputController = TextEditingController();
  final myCtl = Get.put(MyGetXController());
  final format = StringFormat();
  late ListCustomerFrame model = ListCustomerFrame(list: []);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    print('INIT STATE LISTSEARCH SUGGESST');
    service_api.listFramePointCustomer(date: format.formatDate(DateTime.now())).then((value) {
      setState(() {
        model = value;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            height: height,
            decoration: BoxDecoration(
                color: MyColor.white,
                border:
                    Border(left: BorderSide(color: MyColor.grey, width: 1))),
            padding: EdgeInsets.symmetric(
              horizontal: StringFactory.padding16,
            ),
            width: width,
            child: Column(
              children: [
                textCustomNormal(text: 'Frame Update', size: 16),
                Expanded(
                    child: model.list.isNotEmpty
                        ? ListView.builder(
                            itemCount: model.list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return itemCustomerSearchList(
                                  onPress: () {
                                    print('objects ');
                                  },
                                  width: width / 5,
                                  number: '${model.list[index].number}',
                                  name: '${model.list[index].forename}',
                                  date:
                                      '${format.formatDateOnlyDayDDDateFull(model.list[index].frameStartDate)}');
                              // itemListUser(
                              // 	activeState: true,
                              // 	color: MyColor.yellow,
                              // 	datetime: 'sdfas',
                              // 	isMCPlayer: false,
                              // 	level: 'sdf',
                              // 	moreInfor: 'sag',
                              // 	name: 'ags',
                              // 	number: 'ags',
                              // 	onPress: (){},
                              // 	point: 'sdf',
                              // 	width: width,
                              // );
                            },
                          )
                        : Text('...'))
              ],
            )));
  }
}

Widget itemCustomerSearchList({name, number, date, width, onPress}) {
  return Column(
    children: [
      Container(
          decoration:
              BoxDecoration(border: Border.all(color: MyColor.grey_tab)),
          child: Material(
              color: MyColor.white,
              child: InkWell(
                splashColor: MyColor.grey_tab,
                hoverColor: MyColor.grey_tab,
                onTap: () {
                  onPress();
                },
                child: rowCenter(children:[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: width / 5,
                        child: Container(
                            padding: EdgeInsets.all(StringFactory.padding4),
                            child: textCustom(text: '$number', size: 14)),
                      ),
                      SizedBox(
                        width: StringFactory.padding,
                      ),
                      textCustomNormal(text: '$name', size: 14),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textCustomNormal(text: '$date', size: 12),
                      SizedBox(
                        width: StringFactory.padding4,
                      ),
                      Icon(Icons.date_range, color: MyColor.grey, size: 14),
                    ],
                  ),
                ]),
              ))),
      SizedBox(height: StringFactory.padding)
    ],
  );
}
