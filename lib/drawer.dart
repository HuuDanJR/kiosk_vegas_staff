import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/button_custome.dart';
import 'package:vegas_point_portal/widget/itemMenu.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class MyDrawer extends StatefulWidget {
  String? number, name, total_point, level, title,current_point;
  MyDrawer(
      {Key? key,
      this.number,
      this.name,
						this.current_point,
      this.total_point,
      this.level,
      this.title})
      : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final stringFormat = StringFormat();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final width_layout = width / 2;
    return Container(
      decoration: BoxDecoration(
        color: MyColor.white,
        gradient: LinearGradient(
            colors: [
              MyColor.yellow_accent,
              MyColor.yellow_gradient2,
              MyColor.yellow_gradient1,
              MyColor.yellow_accent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp),
      ),
      width: width / 2,
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: StringFactory.padding16 / 2,
          horizontal: StringFactory.padding16),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textCustomNormalColorFont(
                  text: StringFactory.label_drawer_logo,
                  font: StringFactory.titleFont,
                  size: 12,
                  color: MyColor.black_text),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: MyColor.black_text,
                    size: 32,
                  ))
            ],
          ),
          Divider(
            color: MyColor.grey_tab3,
          ),
          SizedBox(height: StringFactory.padding),
          Container(
            height: 75,
            width: width * 2 / 5,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/logo_app_yellow.png',
              fit: BoxFit.contain,
            ),
          ),
          textCustomNormalColorFont(
            text: StringFactory.label_drawer_welcome +
                ', ${widget.title} ${widget.name} ',
            color: MyColor.black_text,
            font: StringFactory.mainFont,
            size: 18,
          ),
          textCustomNormalColorFont(
            text: '(${widget.number})',
            color: MyColor.black_text,
            font: StringFactory.mainFont,
            size: 16,
          ),
          SizedBox(height: StringFactory.padding),
          // itemCard(
          //     hasIcon: true,
          //     onPress: () {
          //       debugPrint('on press total point available');
          //     },
          //     width: width,
          //     text: 'Total Point Available',
          //     text2: '${widget.current_point} P'),
          // SizedBox(height: StringFactory.padding),
          Divider(
            color: MyColor.grey_tab3,
          ),
          SizedBox(height: StringFactory.padding16),
          // itemMenu(
          //     text: 'Membership Information',
          //     icon: iconCustom(Icons.person),
          //     onPress: () {
          //       debugPrint('click membership');
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => MemberShipPage(
          //               number: widget.number,
										// 														current_point: widget.current_point,
          //               totalPoint: widget.total_point,
          //               level: widget.level,
          //               name: widget.name,
          //             ),
          //           ));
          //     },
          //     width: width),
          itemMenu(
              text: 'Point Check Kiosk',
              icon: iconCustom(Icons.point_of_sale),
              onPress: () {
                debugPrint('click point check');
                Navigator.pop(context);
              },
              width: width),
														itemMenu(
              text: 'Active Vouchers',
              icon: iconCustom(Icons.airplane_ticket_sharp),
              onPress: () {
                debugPrint('click Voucher');
                // Navigator.pushNamed(context, '/map');
                Navigator.of(context).pushNamed('/vouchers');
              },
              width: width),
          SizedBox(height: StringFactory.padding16),
          // itemMenu(
          //     text: 'Map',
          //     icon: iconCustom(Icons.map),
          //     onPress: () {
          //       debugPrint('click Map');
          //       // Navigator.pushNamed(context, '/map');
          //     },
          //     width: width),
          // SizedBox(height: StringFactory.padding16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // buttonCustom(
              //   width: width_layout * .45,
              //   text: StringFactory.button_home,
              //   onPressed: () {
              //     debugPrint('click home');
              //     Navigator.of(context).pop();
              //   },
              // ),
              buttonCustom(
																enable: true,
                text: StringFactory.button_logout,
                width: width_layout * .45,
                onPressed: () {
                  debugPrint('click log out');
                },
              ),
            ],
          ),
          SizedBox(height: StringFactory.padding16),
          Divider(
            color: MyColor.grey_tab3,
          ),
          textCustomNormalColorFont(
            textalign: TextAlign.left,
            text: stringFormat.formatDayDateTimeDisplay(DateTime.now()),
            color: MyColor.black_text,
            font: StringFactory.mainFont,
            size: 14,
          ),
          SizedBox(height: StringFactory.padding),
        ],
      ),
    );
  }
}
