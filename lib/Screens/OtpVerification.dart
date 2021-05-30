import 'dart:math';

import 'package:dmms/CustomWidgets/Toast.dart';
import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:dmms/Screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dmms/Models/Result.dart';
import 'package:dmms/Screens/test.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;
  final String otp;
  final Result result;
  OtpScreen({Key key, @required this.mobile,@required this.otp,@required this.result}) : super(key:key);
  @override
  _OtpScreenState createState() => _OtpScreenState(mobile:mobile,otp: otp,result: result);
}

class _OtpScreenState extends State<OtpScreen> {
  final String mobile;
  final String otp;
  final Result result;
  final otpValue = TextEditingController();
  _OtpScreenState({this.mobile,this.otp,this.result});


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/back.png'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 180),
                    Image(
                      image: AssetImage('assets/logo_new.png'),
                      height:75,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 40),

                    TextField(
                      controller: otpValue,
                      obscureText: true,
                      decoration: editTextStyle.copyWith(hintText: 'Enter OTP').copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.orange,
                                Colors.deepOrange,
                              ]
                          )
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          if(otpValue.text=="")
                            {
                              //show otp empty
                              showToast("OTP not entered", Colors.red[500]);
                            }
                          else{
                            checkOTP();
                          }

                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Verify',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'nunito_bold'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 22,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  void checkOTP() async {

    if(result.data[0].status==1 && otp==otpValue.text)
    {
      print("success");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("MemberID",result.data[0].memberID);
      await prefs.setString("Password",result.data[0].password);
      await prefs.setString("Mobile",result.data[0].mobile);
      Navigator.push(context, MaterialPageRoute(
          builder: (_)=>testApp(memberID:result.data[0].memberID ,password:"1234")
        //LoginScreen(memberID:result.data[0].memberID)
      ));
    }
    else{
      //show otp incorrect
      showToast("Incorrect OTP", Colors.red[500]);
      print("otp incorrect");
    }
  }
}
