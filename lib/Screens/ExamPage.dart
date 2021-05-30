import 'package:flutter/cupertino.dart';
import 'package:dmms/Models/Exam.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dmms/Models/RemainingTime.dart';

class ExamPage extends StatelessWidget
{
  final String ExamID,MemberID,PaperID;
  ExamPage({this.ExamID,this.MemberID,this.PaperID});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<List<RemainingTime>>(
          future: fetchRemaingTime(http.Client(),ExamID,MemberID),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? getRemainingTime(snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
        Expanded(
          child: SizedBox(
            child: FutureBuilder<List<Exam>>(
              future: fetchList(http.Client(),ExamID,PaperID,MemberID),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? list(exam: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        )
      ],
    );
  }
  Widget getRemainingTime(List<RemainingTime> rt ) {

    return Text("Remaining Time : "+rt[0].remainingTime);
  }
}
Future<List<RemainingTime>> fetchRemaingTime(http.Client client,String ExamID,String MemberID) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"getduration","examid":"${ExamID}","memberid":"${MemberID}"}'
  });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));

  return compute(parseRemainingTime,response.body);
}



List<RemainingTime> parseRemainingTime(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1.map<RemainingTime>((json) => RemainingTime.fromJson(json)).toList();
}


Future<List<Exam>> fetchList(http.Client client,String ExamID,String PaperID,String MemberID) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"fillpaper","examid":"${ExamID}","paperid":"${PaperID}","memberid":"${MemberID}"}'
  });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));

  return compute(parseExam,response.body);
}



List<Exam> parseExam(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1.map<Exam>((json) => Exam.fromJson(json)).toList();
}


class list extends StatelessWidget {

  final List<Exam> exam;
  BuildContext context;
  list({this.exam});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ListView.builder(scrollDirection: Axis.vertical,itemCount: exam.length,itemBuilder: (BuildContext context, int index)
      {
        return buildExamItem(exam[index]);
      },
    );
  }

  //each Exam item
  Widget buildExamItem(Exam exam) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Column(
        children: <Widget>[
          Text("Question : "+exam.QUESTION),
          Text("Option A"+exam.ANSWERA),
          Text("Option B"+exam.ANSWERB),
          Text("Option C"+exam.ANSWERC),
          Text("Option D"+exam.ANSWERD),
          Text("Option E"+exam.ANSWERE),
        ],
      )
    );
  }


}