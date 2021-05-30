class Result{
  final String statusCode;
  final String status;
  final List<Data> data;
  Result({this.statusCode,this.status,this.data});
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        statusCode: json['statuscode'],
        status: json['status'],
        data:  (json['data'] as List).map<Data>((json) => Data.fromJson(json)).toList()
    );
  }
}
class Data{
  final int status;
  final String memberID;
  final String password;
  final String mobile;

  Data({this.status,this.memberID,this.password,this.mobile});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        status: json['status'],
        memberID: json['MEMBERID'],
        password: json['PASSWORD'],
        mobile: json['MOBILE']
    );
  }

}