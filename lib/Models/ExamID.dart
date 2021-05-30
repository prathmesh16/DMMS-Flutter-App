class ExamID{
  final int examid;
  ExamID({this.examid});
  factory ExamID.fromJson(Map<String, dynamic> json) {
    return ExamID(
      examid: json["ID"]
    );
  }
}