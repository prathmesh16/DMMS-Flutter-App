import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class testApp extends StatefulWidget {
  final String memberID;
  final String password;
  testApp({this.memberID,this.password});
  @override
  _testAppState createState() => _testAppState(memberID: memberID,password: password);
}

class _testAppState extends State<testApp> {
  final String memberID;
  final String password;
  _testAppState({this.memberID,this.password});
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text('Test'),
      ),
      body: WebView(
        initialUrl: "http://www.nursingtestseries.com/app/login.aspx?userID=${memberID}&password=${password}",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
