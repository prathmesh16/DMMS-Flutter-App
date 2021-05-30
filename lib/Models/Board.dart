class Board{
  final int Id;
  final String BoardName;
  final String image;
  final String image_alttag;
  final String AddDate;
  Board({this.Id,this.BoardName,this.image,this.image_alttag,this.AddDate});
  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
        Id: json["Id"],
      BoardName: json["BoardName"],
      image: json["image"],
      image_alttag: json["image_alttag"],
      AddDate: json["AddDate"]
    );
  }
}