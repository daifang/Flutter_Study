import 'dart:ffi';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void toast(String msg,
    [Toast toastLength,
    ToastGravity gravity,
    Color backgroundColor,
    Color textColor,
    Double fontSize]) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength != null ? toastLength : Toast.LENGTH_SHORT,
      gravity: gravity != null ? gravity : ToastGravity.BOTTOM,
      backgroundColor: backgroundColor != null
          ? backgroundColor
          : Color.fromRGBO(50, 50, 50, 0.8),
      textColor: textColor != null ? textColor : Colors.white,
      fontSize: fontSize != null ? fontSize : 16.0);
}
