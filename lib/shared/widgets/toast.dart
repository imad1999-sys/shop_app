import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String text , required ToastCases toastCases}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(toastCases),
      textColor: chooseTextColor(toastCases),
      fontSize: 16.0
  );
}

enum ToastCases { ERROR, WARNING, SUCCESS }


Color chooseToastColor(ToastCases toastCases){
  switch(toastCases){
    case ToastCases.SUCCESS:
      return Color(0xffFCFC00);
    case ToastCases.WARNING:
      return Color(0xffA6D700);
    case ToastCases.ERROR:
      return Color(0xffD71700);
  }
}
Color chooseTextColor(ToastCases toastCases){
  switch(toastCases){
    case ToastCases.SUCCESS:
      return Color(0xff0E0E0D);
    case ToastCases.WARNING:
      return Color(0xff0E0E0D);
    case ToastCases.ERROR:
      return Color(0xffF5F5EF);
  }
}