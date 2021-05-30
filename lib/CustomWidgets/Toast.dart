import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

dynamic showToast(String msg,Color bgColor){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 15.0
  );
}
