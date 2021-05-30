import 'package:dmms/CustomWidgets/NavigationDrawer.dart';
import 'package:flutter/material.dart';

dynamic setAppbar(String title) {
  return AppBar(
    centerTitle: false,
    elevation: 0,
    leading:Builder(
        builder:(BuildContext context){
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
                Scaffold.of(context).openDrawer();
            },
          );
        } ),
    backgroundColor:Colors.red,
    title: Text(
      title,
      style: TextStyle(
//        fontSize: 21,
        fontFamily: 'nunito_bold',
        color: Colors.white,
      ),
    ),
  );
}