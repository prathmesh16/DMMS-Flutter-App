import 'package:flutter/cupertino.dart';
import 'package:dmms/Models/image_quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListOfImageQuizAPI extends StatelessWidget
{
  ListOfImageQuizAPI();

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<ImageQuiz>>(
        future: fetchList(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? list(a: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      );
  }

}

Future<List<ImageQuiz>> fetchList(http.Client client) async {
  var Request={"MethodName":"mypaper","memberid":"RJ19617725"};
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },body: jsonEncode(<String, String>{
    "Request":Request.toString()
  }),);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}
List<ImageQuiz> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ImageQuiz>((json) => ImageQuiz.fromJson(json)).toList();
}
class list extends StatelessWidget {

  final List<ImageQuiz> a;
  BuildContext context;

  list({this.a});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: a.length+1,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < a.length)
            return buildImageQuizItem(index, a);
          else
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'See More',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87
                    ),
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
    );
  }

  //image quiz item
  Widget buildImageQuizItem(int index, List<ImageQuiz> imageQuiz) {
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
                image: AssetImage('assets/quiz.png'),
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 110,
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