import 'package:dmms/API/ListOfMyPaperAPI.dart';
import 'package:dmms/CustomWidgets/NavigationDrawer.dart';
import 'package:dmms/CustomWidgets/appbar.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPapers extends StatefulWidget {
  @override
  _MyPapersState createState() => _MyPapersState();
}

class _MyPapersState extends State<MyPapers> {
  Future<String> MemberID = Future<String>.delayed(
    Duration(seconds: 0),
        () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("MemberID")!="" && prefs.getString("MemberID") !=null)
      {
        return prefs.getString("MemberID");
      }
      return "";
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppbar("Our Papers"),
      drawer: NavDrawer(),
      body:  FutureBuilder<String>(
          future: MemberID, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data);
              return ListOfMyPaperAPI(MemberID: snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          }
      ),

    );
  }
}
