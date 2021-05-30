import 'package:flutter/material.dart';

final editTextStyle = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.grey[500],
  ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 1,
          color: Colors.blue[700],
        )));
