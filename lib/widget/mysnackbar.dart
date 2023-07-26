import 'package:flutter/material.dart';

mysnackBar(message) {
  return SnackBar(
						duration: Duration(milliseconds: 500),
      content: Text(message),
      // action: SnackBarAction(
      //   textColor: Colors.grey,
      //   label: 'CLOSE',
      //   onPressed: () {},
      // )
						);
}
