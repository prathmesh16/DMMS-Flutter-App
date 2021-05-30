import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(
          'Course Details',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'nunito_bold',
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image:AssetImage('assets/i2.jpg'),
                      //height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'JIPMER Staff Nurse Exam-2021 Premium Test Paper',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'nunito_bold',
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'The only course you need to learn web development - HTML, CSS, JS, Node, and More!',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                      letterSpacing: 0.35
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 64,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green[700],
                        ),
                        child: Center(
                          child: Text(
                            '4.5 ⭐',
                            style: TextStyle(
                              fontSize: 14.5,
                              color: Colors.white,
                              fontFamily: 'nunito_bold',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Text(
                        '(81665 Ratings)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.5,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '114521 students enrolled',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[200],
                            letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 96,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 17,
                                  color: Colors.orangeAccent,
                                ),

                              ),
                              TextSpan(
                                text: ' Full test based on exam pattern',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 13.5,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 96,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 17,
                                  color: Colors.orangeAccent,
                                ),

                              ),
                              TextSpan(
                                text: ' Paper designed by expert faculty',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 13.5,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 96,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 17,
                                  color: Colors.orangeAccent,
                                ),

                              ),
                              TextSpan(
                                text: ' Nursing test series, 12 more',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 13.5,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
//                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Container(
//                        width: 96,
//                          child: Text(
//                            'Full test based on exam pattern',
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 13.5,
//                            ),
//                            overflow: TextOverflow.clip,
//                            textAlign: TextAlign.left,
//                          ),
//                        ),
//                      Container(
//                        width: 96,
//                        child: Text(
//                          'Paper designed by the expert faculty',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 13.5,
//                          ),
//                          overflow: TextOverflow.clip,
//                          textAlign: TextAlign.left,
//                        ),
//                      ),
//                      Container(
//                        width: 96,
//                        child: Text(
//                          'Nursing test series, 12 more',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 13.5,
//                          ),
//                          overflow: TextOverflow.clip,
//                          textAlign: TextAlign.left,
//                        ),
//                      ),
//                    ],
//                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '₹ 80/-',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'nunito_bold',
                              fontSize: 15
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width:10),
                      FlatButton(
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
                        },
                      ),
                      SizedBox(width:10),
                      FlatButton(
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
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
