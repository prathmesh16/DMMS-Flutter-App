import 'dart:math';
import 'package:dmms/CustomWidgets/Toast.dart';
import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:dmms/Screens/Login.dart';
import 'package:dmms/Screens/OtpVerification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dmms/Models/Result.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

Future<Result> fetchData(http.Client client,String name,String password,String email,String mobile,String otp) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"register","mobile":"${mobile}","name":"${name}","email":"${email}","password":"${password}","otp":"${otp}"}'
  });

  return Result.fromJson(json.decode(response.body));
}
class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final state = TextEditingController();
  Future<Result> future;
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
                    SizedBox(height: 140),
                    Image(
                      image: AssetImage('assets/logo_new.png'),
                      height:75,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: name,
                      decoration: editTextStyle.copyWith(hintText: 'Name').copyWith(
                        prefixIcon: Icon(
                          Icons.account_circle,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: mobile,
                      maxLength: 10,
                      decoration: editTextStyle.copyWith(hintText: 'Mobile No.').copyWith(
                        prefixIcon: Icon(Icons.phone_android),
                        counterText: "",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: email,
                      decoration: editTextStyle.copyWith(hintText: 'Email-ID').copyWith(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: editTextStyle.copyWith(hintText: 'Password').copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: state,
                      decoration: editTextStyle.copyWith(hintText: 'Select State').copyWith(
                        prefixIcon: Icon(
                          Icons.location_city,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
                          submit();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'nunito_bold'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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

  void submit() async {
    if(validate())
      {
        int min = 100000; //min and max values act as your 6 digit range
        int max = 999999;
        var randomizer = new Random();
        var rNum = min + randomizer.nextInt(max - min);
        print(name.text+email.text+mobile.text+password.text);
        Result result =await fetchData(http.Client(), name.text, password.text, email.text, mobile.text, rNum.toString());
        if(result.data[0].status==1)
        {
          showToast("Registration Successful", Colors.green[500]);
          print("success");
          Navigator.push(context, MaterialPageRoute(
//                              builder: (_)=>OtpScreen(mobile:mobile.text,otp: rNum.toString(),result: result)
                                builder: (_)=>LoginScreen()
                          ));
        }
        else{
          //show user alredy registered
          showToast("Something went wrong or User already registered", Colors.red[500]);
          print("failed!");
        }
      }
  }

  bool validate() {
    if(name.text==""||email.text==""||mobile.text==""||password.text=="")
      {
        // show all fields are required
          showToast("All fields required", Colors.red[500]);
          return false;
      }
    else if(mobile.text.length!=10)
      {
        showToast("Mobile No. is incorrect", Colors.red[500]);
        return false;
      }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text))
      {
        showToast("Email ID is Invalid", Colors.red[500]);
        return false;
      }
    return true;
  }

}
