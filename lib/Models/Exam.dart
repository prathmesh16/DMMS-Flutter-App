class Exam{

 final int ID;
 final String QUESTION;
 final String ANSWERA;
 final String ANSWERB;
 final String ANSWERC;
 final String ANSWERD;
 final String ANSWERE;
 final String ANSWER;
 final int MARKS;
 final int NAGATIVEMARKS;
 final String GIVENANS;
 final String RIGHT_WRONG;

  Exam({this.ID,this.QUESTION,this.ANSWERA,this.ANSWERB,this.ANSWERC,this.ANSWERD,this.ANSWERE,this.ANSWER,this.MARKS,this.NAGATIVEMARKS,this.GIVENANS,this.RIGHT_WRONG});
  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
        ID: json["ID"],
        QUESTION: json["QUESTION"],
        ANSWERA: json["ANSWERA"],
        ANSWERB: json["ANSWERB"],
        ANSWERC: json["ANSWERC"],
        ANSWERD: json["ANSWERD"],
        ANSWERE: json["ANSWERE"],
        ANSWER: json["ANSWER"],
        MARKS: json["MARKS"],
        NAGATIVEMARKS: json["NEGATIVEMARKS"],
        GIVENANS: json["GIVENANS"],
        RIGHT_WRONG: json["RIGHT_WRONG"]
    );
  }
}