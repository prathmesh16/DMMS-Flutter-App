import 'dart:math';

import 'package:dmms/CustomWidgets/Toast.dart';
import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:dmms/Screens/OtpVerification.dart';
import 'package:dmms/Screens/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dmms/Models/Result.dart';

class LoginScreen extends StatefulWidget {
  final memberID;
  LoginScreen({this.memberID});
  @override
  _LoginScreenState createState() => _LoginScreenState(memberID:memberID);
}

Future<Result> fetchData(http.Client client,String mobile,String otp) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"login","mobile":"${mobile}","otp":"${otp}"}'
  });
  return Result.fromJson(json.decode(response.body));
}

class _LoginScreenState extends State<LoginScreen> {
  final mobile = TextEditingController();
  final password = TextEditingController();
  final memberID;
  _LoginScreenState({this.memberID});
  Result result ;
  @override
  Widget build(BuildContext context) {
    mobile.text=memberID;
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
                      controller: mobile,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: editTextStyle.copyWith(hintText: 'Mobile No.',).copyWith(
                        prefixIcon: Icon(
                          Icons.phone_android,
                        ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                      controller: password,
                      maxLength: 10,
                      decoration: editTextStyle.copyWith(hintText: 'Password').copyWith(
                        prefixIcon: Icon(
                          Icons.keyboard,
                        ),
                        counterText: "",
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
                        onPressed: () async {
                          if(mobile.text!="" && mobile.text.length==10 && password.text!="" && password.text=="1234")
                            {
                             // Navigator.push(context, MaterialPageRoute(builder: (_)=>testApp(memberID: memberID,password: password.text)));
                              //doReq();
                              int min = 100000; //min and max values act as your 6 digit range
                              int max = 999999;
                              var randomizer = new Random();
                              var rNum = min + randomizer.nextInt(max - min);
                              result = await fetchData(http.Client(), mobile.text, rNum.toString());
                              if(result.data[0].status==1)
                              {
                                print("ReqSuccess");
                                showToast("OTP sent", Colors.green[500]);
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpScreen(mobile: mobile.text,otp:rNum.toString(),result: result)));
                              }
                              else{
                                //show user not registered
                                showToast("User not registered", Colors.red[500]);
                                print("ReqFailed");
                              }
                            }
                          else
                            {
                              //show alert mobile incorrect
                              showToast("Incorrect Details", Colors.red[500]);
                            }
                          },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Login',
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
  void doReq() async {
    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    result = await fetchData(http.Client(), mobile.text, rNum.toString());
    if(result.data[0].status==1)
    {
      print("ReqSuccess");
      showToast("OTP sent", Colors.green[500]);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpScreen(mobile: mobile.text,otp:rNum.toString(),result: result)));
    }
    else{
      //show user not registered
      showToast("User not registered", Colors.red[500]);
      print("ReqFailed");
    }

  }
}
