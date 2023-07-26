import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/widget/shakeText.dart';
import 'package:vegas_point_portal/widget/widget.dart';


class RatePageDetail extends StatefulWidget {
  String? name, number;

  RatePageDetail({
    Key? key,
    this.name,
    this.number,
  }) : super(key: key);

  @override
  State<RatePageDetail> createState() => _RatePageDetailState();
}

class _RatePageDetailState extends State<RatePageDetail> {
  final formatterNum = NumberFormat();
  final focus_node = FocusNode();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final api_service = ServiceAPIs();
  final string_format = StringFormat();
  FocusNode inputNode = FocusNode();
		// Holds the text that user typed.
  String text = '';
  // CustomLayoutKeys _customLayoutKeys;
  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final width_web = width * 3.75 / 5;
    final height = MediaQuery.of(context).size.height;
    final ctlPhone = TextEditingController();
    final ctlNode = TextEditingController();
    final ctlEmail = TextEditingController();
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColor.yellow_accent,
          title: textCustomNormalColorFont(
              color: MyColor.white,
              font: StringFactory.mainFont,
              size: 16,
              text: StringFactory.title_rate),
        ),
        body: WillPopScope(
          onWillPop: () => exitFunction(),
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.only(left:StringFactory.padding16,right:StringFactory.padding16,top:StringFactory.padding16),
            child: ListView(
																	padding: const EdgeInsets.all(0),
																	shrinkWrap: true,
              children: [
                SizedBox(
                  height: StringFactory.padding32,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       debugPrint('click sdag');
                //       // openKeyboard();
                //       inputNode.requestFocus();
                //     },
                //     child: textCustom(
                //       text: 'click',
                //     )),
                // TextField(
                // 	keyboardType: TextInputType.text,
                //   //assign the  node like this
                //   focusNode: inputNode,
                //   autofocus: true,
                // ),
                textinput(
                    isNumber: true,
                    icon: Icons.phone,
                    hasIcon: true,
                    hintValue: StringFactory.hint_phone,
                    W: width_web,
                    controller: ctlPhone,
                    onTap: () {
                      debugPrint('ontap phone');
                    }),
                SizedBox(
                  height: StringFactory.padding32,
                ),
                textinput(
                  isNumber: false,
                  icon: Icons.email,
                  hasIcon: true,
                  hintValue: StringFactory.hint_email,
                  W: width_web,
                  controller: ctlEmail,
                ),
                SizedBox(
                  height: StringFactory.padding32,
                ),
                textinput(
                  isNumber: false,
                  isCommenet: true,
                  icon: Icons.note,
                  hasIcon: true,
                  hintValue: StringFactory.hint_note,
                  W: width_web,
                  controller: ctlNode,
                ),
																textCustom(text: text,size:12),
                // SizedBox(
                //   height: StringFactory.padding32,
                // ),
                GetBuilder<MyGetXController>(
                    builder: (controller) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 50),
                            primary: MyColor.yellow_accent,
                          ),
                          onPressed: () {
                            // debugPrint('click send message');
                            // debugPrint('date: ${string_format.formatDate(DateTime.now())} ${ctlEmail.text} ${ctlPhone.text} ${ctlNode.text} ${widget.name} ${widget.number} ${widget.type}');
                            api_service.createFeedBack(
                                  date:string_format.formatDate(DateTime.now()),
                                  email: ctlEmail.text,
                                  phone: ctlPhone.text,
                                  note: ctlNode.text,
                                  name: widget.name,
                                  number: widget.number,
                                  type: controller.valueRate.value,
                                )
                                .then((value) {})
                                .whenComplete(() => showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text(
                                          "Thank you for your feedback",
                                          style: TextStyle(
                                              fontFamily:
                                                  StringFactory.mainFont),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Icon(Icons.check_circle,
                                            color: MyColor.green, size: 38),
                                      ),
                                    ));
                          },
                          child: textCustomNormalColorFont(
                              color: MyColor.white,
                              font: StringFactory.mainFont,
                              size: 16,
                              text: StringFactory.button_rate),
                        )),
																		// SizedBox(height:StringFactory.padding16),
																		// Container(
																		// 	width: width,
																		// 	color:MyColor.grey_tab,
																		// 	child: VirtualKeyboard(
																		// 		onKeyPress: _onKeyPress,
																		// 		defaultLayouts: [
                  //    VirtualKeyboardDefaultLayouts.English
                 	//  ],
																		// 		type: VirtualKeyboardType.Alphanumeric,
																		// 	),
																		// ),
              ],
            ),
          ),
        ));
  }

  exitFunction() {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage()));
    Navigator.of(context).pop();
  }
}

