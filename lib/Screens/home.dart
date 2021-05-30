/*import 'dart:ui';
import 'package:dmms/CustomWidgets/NavigationDrawer.dart';
import 'package:dmms/CustomWidgets/appbar.dart';
import 'package:dmms/CustomWidgets/heading_text_style.dart';
import 'package:dmms/CustomWidgets/image_slider.dart';
import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<bool> _onWillPop() async {
    Future.value(false);
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                //onPressed: () => Navigator.of(context).pop(true),
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
  Future<String> name = Future<String>.delayed(
    Duration(seconds: 0),
        () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("MemberID")!="" && prefs.getString("MemberID") !=null)
      {
        return prefs.getString("Mobile");
      }
      return "";
    },
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(49, 139, 176, 1),
    ));
    return new WillPopScope(
      onWillPop: ()=>_onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: setAppbar('DMMS Nursing Academy'),
        drawer: NavDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: FutureBuilder<String>(
                  future: name, // a previously-obtained Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                        return Text(
                          'Welcome ${snapshot.data}',
                          style: headingTextStyle,
                        );
                    }
                    return Text(
                      'Welcome ...',
                      style: headingTextStyle,
                    );
                  }
              ),
            ),
            SizedBox(height: 20),
            ImageSlider(100, 20, imageList),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(cards.length, (index) {
                  DashCard card = cards[index];
                  return buildCardItem(card, 12);
                }),
              ),
            ),
            SizedBox(height: 20),
            ImageSlider(140, 20, imageList),
            SizedBox(height: 30),
            Center(
              child: Text(
                'IMAGE BASED QUIZ',
                style: headingTextStyle,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: imageQuiz.length + 1,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index < imageQuiz.length)
                    return buildImageQuizItem(index);
                  else
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'See More',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[800],
                            size: 15,
                          )
                        ],
                      ),
                    );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.grey[400],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ImageSlider(100, 20, imageList),
            SizedBox(height: 30),
            Center(
              child: Text(
                'VIDEO BASED QUIZ',
                style: headingTextStyle,
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(10),
                crossAxisCount: 3,
                children: List.generate(videoQuiz.length, (index) {
                  DashCard videoQuizCard = videoQuiz[index];
                  return buildCardItem(videoQuizCard, 9);
                }),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color.fromRGBO(49, 139, 176, 1),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '2020 DMMS, All rights reserved',
                  style: TextStyle(
                    fontFamily: 'nunito_bold',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//dashboard card
  Widget buildCardItem(DashCard card, double fontsize) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 0),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Image(
                      height: 36,
                      width: 36,
                      image: AssetImage(card.imageUrl),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      card.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'nunito_bold',
                        color: Colors.grey[800],
                        fontSize: fontsize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                height: 100,
                width: 100,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if (card.onClick != null)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => card.onClick),
                        );
                    },
                    splashColor:
                        Color.fromRGBO(22, 158, 183, 1).withOpacity(0.3),
                    highlightColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //image quiz item
  Widget buildImageQuizItem(int index) {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image(
                image: AssetImage('assets/quiz.webp'),
                height: 36,
                width: 36,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    imageQuiz[index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'nunito_bold'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 110,
                    child: Text(
                      imageQuiz[index].description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dmms/CustomWidgets/NavigationDrawer.dart';
import 'package:dmms/CustomWidgets/Toast.dart';
import 'package:dmms/CustomWidgets/appbar.dart';
import 'package:dmms/CustomWidgets/heading_text_style.dart';
import 'package:dmms/CustomWidgets/image_slider.dart';
import 'package:dmms/Models/Board.dart';
import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/Screens/MyPapers.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dmms/Models/Package.dart';
import 'package:dmms/Screens/course_details_page.dart';
import 'board_courses_page.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<List<Board>> fetchList(http.Client client) async {
  final http.Response response = await http.post(
      'http://nursingtestseries.com/api/android_service.aspx',
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        "Request": '{"MethodName":"board","action":"apphome"}'
      });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));

  return compute(parseboard, response.body);
}

List<Board> parseboard(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1.map<Board>((json) => Board.fromJson(json)).toList();
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
class _HomeState extends State<Home> {
  int _index = 0;

  Future<bool> _onWillPop() async {
    Future.value(false);
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Exit App?'),
        content: new Text('Do you want to exit from the app ?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text(
              'No',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'nunito_bold',
              ),
            ),
          ),
          new FlatButton(
            //onPressed: () => Navigator.of(context).pop(true),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: new Text(
              'Yes',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'nunito_bold',
              ),
            ),
          ),
        ],
      ),
    )) ??
        false;
  }

  Future<String> name = Future<String>.delayed(
    Duration(seconds: 0),
        () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("MemberID") != "" &&
          prefs.getString("MemberID") != null) {
        return prefs.getString("Mobile");
      }
      return "";
    },
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return new WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.grey[80],
        //Colors.grey[100],
        appBar: setAppbar("DMMS Nursing Academy"),
        drawer: NavDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Featured Test Series',
                style: headingTextStyle2,
              ),
            ),
            SizedBox(height: 12),
            FutureBuilder<List<Board>>(
              future: fetchList(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? Boardlist(board: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ), //featured test series
            SizedBox(height: 15),
            //ad banner
            ImageSlider(110, 20, imageList),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Featured Courses',
                style: headingTextStyle2,
              ),
            ),
            SizedBox(height: 8),
            FutureBuilder<List<Package>>(
              future: fetchListPackage(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? Packagelist(package: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
            //featured courses


            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

//dashboard card
  Widget buildCardItem(DashCard card, double fontsize) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, -1),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Image(
                      height: 36,
                      width: 36,
                      image: AssetImage(card.imageUrl),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      card.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'nunito_bold',
                        color: Colors.grey[800],
                        fontSize: fontsize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                height: 100,
                width: 100,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if (card.onClick != null)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => card.onClick),
                        );
                    },
                    splashColor:
                    Color.fromRGBO(22, 158, 183, 1).withOpacity(0.3),
                    highlightColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //image quiz item
  Widget buildImageQuizItem(int index) {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image(
                image: AssetImage('assets/quiz.webp'),
                height: 36,
                width: 36,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    imageQuiz[index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'nunito_bold'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 110,
                    child: Text(
                      imageQuiz[index].description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//featured series  container
class Boardlist extends StatelessWidget {
  final List<Board> board;
  BuildContext context;

  Boardlist({this.board});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: board.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBoardItem(board[index]);
        },
      ),
    );
  }

  //each testseries board item
  Widget buildBoardItem(Board board) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (_) => BoardCoursePage()));
        //showToast('clicked', Colors.red );
      },
      child: Container(
        margin: EdgeInsets.only(right: 4, left: 4),
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey[100]),
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          child: Image.network("http://nursingtestseries.com/" + board.image),
        ),
      ),
    );
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
      margin: EdgeInsets.only(left: 16, right: 16),
      height: 344,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:package.length,
        itemBuilder: (BuildContext context, int index) {
          return buildpackageItem(package[index]);
        },
      ),
    );
  }

  //each testseries package item
  Widget buildpackageItem(Package package) {
    TextStyle textStyle= TextStyle(
      color: Colors.grey[800],
      fontSize: 13,
    );
    TextStyle textStyle2= TextStyle(
      color: Colors.grey[800],
      fontSize: 13,
      fontFamily: 'nunito_bold',
    );
    return Container(
      width: 220,
      margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.grey[100]),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 3
            )
          ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Image.network("http://nursingtestseries.com/" + package.photopath,
              height: 120,
              width: 220,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          SizedBox(height: 10),
          SizedBox(
            height:36,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                (package.packagetitle.length<56)?package.packagetitle:package.packagetitle.substring(0,55)+'...',
                textAlign: TextAlign.left,
                style: textStyle2,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),

            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Total Test Paper - ${package.totalpaper}',
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
          SizedBox(height: 3),
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
                        fontSize: 13
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
                        fontSize: 13
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),);
  }
}

