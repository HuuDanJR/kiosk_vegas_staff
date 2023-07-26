import 'package:flutter/material.dart';
import 'package:vegas_point_portal/widget/mysnackbar.dart';

bool validateFieldSearch(String value, context) {
  RegExp numeric = RegExp(r'^-?[0-9]+$');
  if ((numeric.hasMatch(value)) == false) {
    ScaffoldMessenger.of(context).showSnackBar(mysnackBar('Only Number Allow'));
  }
  return numeric.hasMatch(value);
}
