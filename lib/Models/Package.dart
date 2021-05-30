class Package
{
  final String papertitle;
  final int amount;
  final int totalpaper;
  final String packagetitle;
  final int PACKAGEID;
  final String photopath;
  final String large_photopath;
  Package({this.packagetitle,this.amount,this.totalpaper,this.papertitle,this.PACKAGEID,this.photopath,this.large_photopath});
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
        papertitle: json["papertitle"],
        amount: json["amount"],
        totalpaper: json["totalpaper"],
        packagetitle: json["packagetitle"],
        PACKAGEID: json["PACKAGEID"],
        photopath: json["photopath"],
        large_photopath: json["large_photopath"]
    );
  }
}