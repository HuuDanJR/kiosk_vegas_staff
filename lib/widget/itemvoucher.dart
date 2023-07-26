import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

Widget itemVoucher(
    {width,
    // long_text,
    voucherName,
    voucherType,
    // String? value,
    status,
    String? dateFrom,
    String? dateTo}) {
  return Container(
    decoration: BoxDecoration(
					color: MyColor.white,
					borderRadius: BorderRadius.circular(StringFactory.padding),
					border: Border.all(color:MyColor.grey_tab)
				),
    width: width,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: StringFactory.padding, vertical: StringFactory.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textCustomNormalColorFont(
                  font: StringFactory.mainFont,
                  text: '$voucherName',
                  color: Colors.black,
                  size: 16),
              // SizedBox(height: StringFactory.padding4),
              // textCustomNormalColorFont(
              //     color: MyColor.black_text,
              //     font: StringFactory.mainFont,
              //     text: '$long_text',
              //     size: 12),
              textCustomNormalColorFont(
                  color: MyColor.black_text,
                  font: StringFactory.mainFont,
                  text: 'From:${dateFrom!.replaceAll("00:00", "")}-To: ${dateTo!.replaceAll("00:00", "")}',
                  size: 13),
              SizedBox(height: StringFactory.padding4),
              Row(
                children: [
                  Container(
                    color: MyColor.grey_tab,
                    padding: const EdgeInsets.all(2.5),
                    child: textCustomNormalColorFont(
                        font: StringFactory.mainFont,
                        text: '$voucherType',
                        size: 10),
                  ),
                  SizedBox(
                    width: StringFactory.padding,
                  ),
                  Container(
                    color: status == 'OK'
                        ? MyColor.green
                        : status == "REDEEMED"
                            ? MyColor.grey
                            : MyColor.grey_tab,
                    padding: const EdgeInsets.all(2.5),
                    child: textCustomNormalColorFont(
                        color: MyColor.white,
                        font: StringFactory.mainFont,
                        text: status == "OK" ? "AVAILABLE" : status,
                        size: 10),
                  ),
                ],
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     textCustomNormalColorFont(
          //         font: StringFactory.mainFont, text: '$value\$', size: 18),
          //   ],
          // ),
        ],
      ),
    ),
  );
}
