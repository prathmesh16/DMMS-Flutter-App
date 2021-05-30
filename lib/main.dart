import 'package:dmms/Screens/Initial.dart';
import 'package:dmms/Screens/MyPapers.dart';
import 'package:dmms/Screens/OtpVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dmms/Screens/ForgetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dmms/Screens/home.dart';
import 'package:dmms/Screens/Wrapper.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> checkLogIn = Future<bool>.delayed(
    Duration(seconds: 0),
        () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("MemberID")!="" && prefs.getString("MemberID") !=null)
      {
        return true;
      }
      return false;
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'nunito',
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.blueGrey,
      ),
      home: FutureBuilder<bool>(
          future: checkLogIn, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              //if(snapshot.data==false)
                return InitialScreen();
              //else
                //return Wrapper(); /////////////////
            }
            return InitialScreen();
        }
      ),
    );
  }

}


