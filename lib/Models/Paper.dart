class Paper{
  final int pid;
  final String boardname;
  final int amount;
  final int TotalMarks;
  final int totalattempt;
  final String examdate;
  final tmp examtime;
  final String examdatetime;
  final int packageid;
  final String papertitle;
  //final String solutions;
  final int numberofquestion;
  final int duration;
  Paper({this.pid,this.boardname,this.papertitle,this.numberofquestion,this.amount,this.TotalMarks,this.duration,this.totalattempt,this.examdate,this.examtime,this.examdatetime,this.packageid});
  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
      pid: json["pid"],
      boardname: json['boardname'],
      papertitle: json['papertitle'],
      //solutions: json['solutions'],
      numberofquestion: json['numberofquestion'],
      amount: json['amount'],
      TotalMarks: json['TotalMarks'],
      duration: json['duration'],
      totalattempt: json['totalattempt'],
      examdate: json['examdate'],
      examtime: tmp.fromJson(json['examtime']),
      examdatetime: json['examdatetime'],
      packageid: json['packageid']
    );
  }
}
class tmp
{
  final int Ticks;
  final int Days;
  final int Hours;
  final int MilliSeconds;
  final int Minutes;
  final int Seconds;
  final int TotalDays;
  final int TotalHours;
  final int TotalMilliSeconds;
  final int TotalMinutes;
  final int TotalSeconds;
  tmp({this.Ticks,this.Days,this.Hours,this.MilliSeconds,this.Minutes,this.Seconds,this.TotalDays,this.TotalHours,this.TotalMilliSeconds,this.TotalMinutes,this.TotalSeconds});
  factory tmp.fromJson(Map<String, dynamic> json) {
    return tmp(
      Ticks: json['Ticks'],
      Days: json['Days'],
      Hours: json['Hours'],
      MilliSeconds: json['MilliSeconds'],
      Minutes: json['Minutes'],
      Seconds: json['Seconds'],
      TotalDays: json['TotalDays'],
      TotalHours: json['TotalHours'],
      TotalMilliSeconds: json['TotalMilliSeconds'],
      TotalMinutes: json['TotalMinutes'],
      TotalSeconds: json['TotalSeconds']
    );
  }
}