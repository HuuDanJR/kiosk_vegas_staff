import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';

Widget myprogress_circular(){
	return Center(
                    child: CircularProgressIndicator(
                    color: MyColor.grey,
                    strokeWidth: 1,
                    backgroundColor: MyColor.grey_tab,
                  ));
}