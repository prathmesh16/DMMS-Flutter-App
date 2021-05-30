import 'package:dmms/CustomWidgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dmms/Models/Package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dmms/Screens/course_details_page.dart';
class BoardCoursePage extends StatefulWidget {
  @override
  _BoardCoursePageState createState() => _BoardCoursePageState();
}
Future<List<Package>> fetchListPackage(http.Client client) async {
  final http.Response response =
  await http.post('http://nursingtestseries.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"packageall","action":"all"}'
  });
  return compute(parsePackage,response.body);
}
List<Package> parsePackage(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  return tmp1.map<Package>((json) => Package.fromJson(json)).toList();
}
class _BoardCoursePageState extends State<BoardCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text(
            'Courses',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'nunito_bold',
          ),
        ),

      ),
      body:
      FutureBuilder<List<Package>>(
        future: fetchListPackage(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Packagelist(package: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
//      Container(
//        child: ListView.builder(
//          itemCount: 12,
//          itemBuilder: (context,index){
//            return courseCard(index);
//          },
//        ),
//      ),
    );
  }
}

class courseCard extends StatelessWidget {
  int _index;
  Package package;
  courseCard(this.package);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle= TextStyle(
      color: Colors.grey[800],
      fontSize: 14,
    );
    TextStyle textStyle2= TextStyle(
      color: Colors.grey[800],
      fontSize: 15,
      fontFamily: 'nunito_bold',
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey[100]),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child:Image.network("http://nursingtestseries.com/" + package.photopath,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
//            child: Image.network("http://nursingtestseries.com/" + package.photopath,
//              height: 120,
//              width: 220,
//              fit: BoxFit.cover,
//            ),
            borderRadius: BorderRadius.circular(12),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
            package.packagetitle,
              textAlign: TextAlign.left,
              style: textStyle2,
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),

          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Total Test Paper - '+package.totalpaper.toString(),
              style:textStyle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Full test based on exam pattern',
              style:textStyle,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Paper by expert faculty',
              style:textStyle,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 4),
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Join Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito_bold',
                        fontSize: 15
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (_) => DetailsPage()));
                  },
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 4),
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito_bold',
                        fontSize: 15
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),);
  }
}
class Packagelist extends StatelessWidget {
  final List<Package> package;
  BuildContext context;

  Packagelist({this.package});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: ListView.builder(
        itemCount:package.length,
        itemBuilder: (BuildContext context, int index) {
          return courseCard(package[index]);
        },
      ),
    );
  }
}