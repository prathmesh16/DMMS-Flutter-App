class RemainingTime{
  final String remainingTime;
  RemainingTime({this.remainingTime});
  factory RemainingTime.fromJson(Map<String, dynamic> json) {
    return RemainingTime(
        remainingTime: json["REMAININGTIME"]
    );
  }
}