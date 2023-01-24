import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  required String msg,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, warning, loading }

Color toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
    case ToastStates.loading:
      color = Colors.blueAccent;
      break;
  }
  return color;
}
