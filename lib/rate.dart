import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/user.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/itemIcon.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class RatePage extends StatefulWidget {
  double width;
  int? type;
  Function? function;
  RatePage({
    Key? key,
    required this.width,
    this.function,
    this.type,
  }) : super(key: key);

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  final getx = Get.put(MyGetXController());
  final api_service = ServiceAPIs();
  final string_format = StringFormat();
  String? name, number, email, phone;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    getx.resetValueRate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColor.white,
        // borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(StringFactory.padding16),
      width: widget.width,
      child: Column(
        children: [
          textCustomNormalColorFont(
              color: MyColor.black_text,
              font: StringFactory.mainFont,
              size: 22,
              text: StringFactory.rateme),
          SizedBox(height: StringFactory.padding16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              itemIcon(
                  type: 'icons/happy.png',
                  text: 'Very Happy',
                  context: context,
                  onTap: () {
                    widget.function!();
                    requestFeedBack(0);
                    getx.saveValueRate(0);
                  }),
              itemIcon(
                  type: 'icons/happiness.png',
                  text: 'Happy',
                  context: context,
                  onTap: () {
                    widget.function!();
																				requestFeedBack(1);
                    getx.saveValueRate(1);
                  }),
              itemIcon(
                  type: 'icons/happiness_1.png',
                  text: 'Normal',
                  context: context,
                  onTap: () {
                    widget.function!();
																				requestFeedBack(2);
                    getx.saveValueRate(2);
                  }),
              itemIcon(
                  type: 'icons/sad.png',
                  text: 'Bad',
                  context: context,
                  onTap: () {
                    widget.function!();
																				requestFeedBack(3);
                    getx.saveValueRate(3);
                  }),
            ],
          )
        ],
      ),
    );
  }

  requestFeedBack(type) {
    api_service
        .createFeedBack(
          date: string_format.formatDate(DateTime.now()),
          email: email,
          phone: phone,
										type_name: type ==0 ? 'Very Happy' : type == 1 ? 'Happy' : type ==2 ? 'Normal' : 'Bad',
          note: 'feedback from number:$number name:$name',
          name: name,
          number: number,
          type: type,
        )
        .then((value) {})
        .whenComplete(() => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  "Thank you for your feedback",
                  style: TextStyle(fontFamily: StringFactory.mainFont),
                  textAlign: TextAlign.center,
                ),
                content:
                    Icon(Icons.check_circle, color: MyColor.green, size: 38),
              ),
            ));
  }
}
