import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/shakeText.dart';

Widget buildRow2WithShakeText({text, value, width, shakeKey}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColor.yellow3,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(10),
      color: MyColor.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomGrey(text: '$text', size: 22),
        ShakeWidget(
          key: shakeKey,
          shakeCount: 3,
          shakeOffset: 10,
          shakeDuration: const Duration(milliseconds: 500),
          child: textCustom(text: '$value', size: 22),
        ),
      ],
    ),
  );
}

Widget textinput(
    {bool hasIcon = false,
    bool isNumber = false,
    onPressList,
    fontSize,
    onSubmitFunc,
    onchange,
    onTap,
    icon,
    onPressClear,
    TextEditingController? controller,
    required String? hintValue,
    required double? W,
    bool? isSecure = false,
    textAlign,
    bool? hasCloseIcon = false,
    funcOrther,
    isCommenet = false,
    isCloseFunc = true,
    hasClose2 = true,
    enable = true}) {
  return SizedBox(
    width: W,
    child: TextFormField(
      enabled: enable,
      obscureText: isSecure!,
      cursorWidth: 2.5,
      textAlign: textAlign,
      cursorColor: MyColor.black_text,
      showCursor: true,
      autofocus: true,
      maxLines: isCommenet == true ? 5 : 1,
      onTap: () => onTap(),
      onFieldSubmitted: (value) => onSubmitFunc(value),
      keyboardType:
          isNumber == false ? TextInputType.text : TextInputType.number,
      onChanged: (value) => onchange(value),
      style: TextStyle(
          fontFamily: StringFactory.mainFont,
          fontSize: fontSize,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(1),
          suffixIcon: rowItemIcon(
              controller: controller,
              onPressList: onPressList,
              onPressClear: onPressClear),
          contentPadding: EdgeInsets.all(StringFactory.padding16),
          counterText: "",
          labelStyle: TextStyle(
              color: MyColor.black_text,
              fontFamily: StringFactory.mainFont,
              fontSize: 24),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow3, width: 3.0),
            borderRadius: BorderRadius.circular(StringFactory.padding16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.grey_tab, width: 3.0),
            borderRadius: BorderRadius.circular(StringFactory.padding16),
          ),
          hintText: hintValue),
      controller: controller,
    ),
  );
}

Widget rowItemIcon(
    {TextEditingController? controller, onPressList, onPressClear}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
          splashColor: MyColor.grey_tab,
          onPressed: () {
            onPressClear();
          },
          icon: Tooltip(
              message: 'clear number',
              child: Icon(Icons.close, color: MyColor.black_text))),
      IconButton(
          splashColor: MyColor.grey_tab,
          onPressed: () {
            onPressList();
          },
          icon: Tooltip(
            message: 'show advanced search ',
            child: Icon(
              Icons.grid_3x3_rounded,
              color: MyColor.black_text,
            ),
          )),
    ],
  );
}

Widget textinputCustom(
    {isNumber,
    onPressAdd,
    fontSize,
    onSubmitFunc,
    onchange,
    onTap,
    icon,
    TextEditingController? controller,
    required String? hintValue,
    required double? W,
    bool? isSecure = false,
    textAlign,
    bool? hasCloseIcon = false,
    funcOrther,
    isCommenet = false,
    hasborder = true,
    isCloseFunc = true,
    hasClose2 = true,
    enable = true}) {
  return SizedBox(
    width: W,
    child: TextFormField(
      enabled: enable,
      obscureText: isSecure!,
      cursorWidth: 2.5,
      textAlign: textAlign,
      cursorColor: MyColor.black_text,
      showCursor: true,
      autofocus: true,
      maxLines: isCommenet == true ? 5 : 1,
      onTap: () => onTap(),
      onFieldSubmitted: (value) => onSubmitFunc(value),
      keyboardType:
          isNumber == false ? TextInputType.text : TextInputType.number,
      onChanged: (value) => onchange(value),
      style: TextStyle(
          fontFamily: StringFactory.mainFont,
          fontSize: fontSize,
          color: MyColor.black_text,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.grey_tab, width: 1.0),
            borderRadius: BorderRadius.circular(StringFactory.padding32),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(1),
          suffixIcon: IconButton(
              onPressed: () {
                controller!.clear();
              },
              icon: Icon(Icons.close, color: MyColor.grey)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: StringFactory.padding16),
          counterText: "",
          labelStyle: TextStyle(color: MyColor.black_text, fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow_accent, width: 1.0),
            borderRadius: BorderRadius.circular(StringFactory.padding32),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow_accent, width: 1.0),
            borderRadius: BorderRadius.circular(StringFactory.padding32),
          ),
          hintText: hintValue),
      controller: controller,
    ),
  );
}

Widget buildRow2(
    {text,
    value,
    hasChildRow = false,
    width,
    dateFrame,
    bool? hasIcon = false,
    shakeKey,
    onPressed,
    bool hasShakeFunc = false}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(StringFactory.padding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(StringFactory.padding4),
      border: Border.all(
        color: MyColor.grey_tab,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(10),
      color: MyColor.white,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textCustomGrey(text: '$text', size: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hasShakeFunc == true
                    ? ShakeWidget(
                        child: textCustom(text: '$value', size: 16),
                        key: shakeKey,
                        shakeCount: 3,
                        shakeOffset: 10,
                        shakeDuration: const Duration(milliseconds: 550),
                      )
                    : textCustom(text: '$value', size: 16),
                const SizedBox(
                  width: 15,
                ),
                hasIcon == true
                    ? InkWell(
                        onTap: onPressed,
                        child: Container(
                            padding: EdgeInsets.all(StringFactory.padding4),
                            decoration: BoxDecoration(
                              color: MyColor.yellow,
                              borderRadius:
                                  BorderRadius.circular(StringFactory.padding4),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyColor.black_text,
                              size: 16,
                            )),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        hasChildRow == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon(Icons.date_range, size: 16, color: MyColor.grey),
                  // SizedBox(
                  //   width: StringFactory.padding,
                  // ),
                  textCustomGrey(text: '${dateFrame}', size: 12),
                ],
              )
            // textCustomGrey(text: '${dateFrame}', size: 12),
            : Container(width: 0),
      ],
    ),
  );
}

Widget buildRow2Container({children, width}) {
  return Container(
      width: width,
      padding: EdgeInsets.all(StringFactory.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StringFactory.padding4),
        border: Border.all(
          color: MyColor.grey_tab,
          width: 1,
        ),
        // borderRadius: BorderRadius.circular(10),
        color: MyColor.white,
        // color: Color(0xFFE0E0E0).withOpacity(.5)
      ),
      child: children);
}

Widget buildRowContainerDetect({children, width, isMobile = false}) {
  return Container(
      width: width,
      padding: EdgeInsets.all(StringFactory.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StringFactory.padding4),
        border: Border.all(
          color: MyColor.grey_tab,
          width: 1,
        ),
        // borderRadius: BorderRadius.circular(10),
        color: MyColor.white,
        // color: Color(0xFFE0E0E0).withOpacity(.5)
      ),
      child: isMobile == false
          ? Row(
              children: children,
            )
          : Column(
              children: children,
            ));
}

Widget rowCenter({children,isMobile =false}) {
  return isMobile==false? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children) : Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children);
}



Widget buildRowIcon({text, value, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColor.black_text,
        width: 1,
      ),
      color: MyColor.yellow3,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomGrey(text: '$text', size: 22),
        textCustom(text: '$value', size: 22),
      ],
    ),
  );
}

Widget buildRowTextNormal({text, value, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColor.yellow3,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(10),
      color: MyColor.grey_tab.withOpacity(.25),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomNormal(text: '$text', size: 18),
        textCustomNormal(text: '$value', size: 18),
      ],
    ),
  );
}

Widget buildRow({text1, text2, value1, value2, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: MyColor.yellow.withOpacity(.15),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 1),
        ),
      ],
      border: Border.all(
        color: MyColor.grey_tab,
        width: 1.5,
      ),
      color: MyColor.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textCustomGrey(text: '$text1', size: 22),
            textCustom(text: '${value1}', size: 22),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textCustomGrey(text: '$text2', size: 22),
            textCustom(text: '${value2}', size: 22),
          ],
        ),
      ],
    ),
  );
}

Widget containerYellow({width, widget, onPressed}) {
  return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(child: widget),
          Expanded(
              child: IconButton(
                  onPressed: onPressed, icon: const Icon(Icons.calendar_month)))
        ],
      ),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.yellow, width: 3)));
}

Widget itemDate(width, onPress, String text, controller) {
  return SizedBox(
      width: width / 2,
      child: TextField(
        maxLength: 10,
        keyboardType: TextInputType.text,
        onChanged: (String value) {},
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onPress,
              icon: const Icon(Icons.calendar_month),
            ),
            border: const OutlineInputBorder(),
            counter: const SizedBox.shrink(),
            hintText: 'Select start date',
            hintStyle: const TextStyle(
              fontSize: 14,
            )),
        controller: controller,
      ));
}

Widget rowItem(String name, number) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name.toUpperCase(),
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
        Text(number.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
      ],
    ),
  );
}

Widget textCustom(
    {String? text, double? size, fontWeight = FontWeight.normal}) {
  return Text(text!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: MyColor.black_text,
          fontWeight: FontWeight.bold));
}

Widget textCustomWithNumFormat(
    {String? text,
    double? size,
    fontWeight = FontWeight.normal,
    required NumberFormat format}) {
  return Text(format.format(int.parse(text!).abs()),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: MyColor.black_text,
          fontWeight: FontWeight.bold));
}

Widget textCustomNormal({
  text,
  double? size,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: MyColor.black_text,
          fontWeight: FontWeight.normal));
}

Widget textCustomNormalColor(
    {text, double? size, color, fontWeight = FontWeight.normal}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight));
}

Widget textCustomNormalColorFont(
    {text, double? size, color, font, textalign = TextAlign.center}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      textAlign: textalign,
      style: TextStyle(
        color: color,
        fontSize: size,
      ));
}

myTextSpan({font, color, size}) {
  TextSpan(
      text: 'hello',
      style: TextStyle(
        color: color,
        fontSize: size,
      ));
}

Widget textCustomGrey({
  text,
  double? size,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size, color: Colors.black38, fontWeight: FontWeight.bold));
}
