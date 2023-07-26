import 'package:flutter/material.dart';
import 'package:vegas_point_portal/util/mycolor.dart';

Future selectDate({
  required BuildContext context,
}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // Must have THEME else cancel button will be error
          ),
          child: child!,
        );
      },
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31));
  return picked;
}
