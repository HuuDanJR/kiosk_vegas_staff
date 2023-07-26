

import 'dart:convert';

List<PointM> pointMFromJson(String str) => List<PointM>.from(json.decode(str).map((x) => PointM.fromJson(x)));

String pointMToJson(List<PointM> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPointM {
  final List<PointM> listOfPoint;

  ListPointM({
    required this.listOfPoint,
  });

	 factory ListPointM.fromJson(List<dynamic> parsedJson) {
    List<PointM> photos = parsedJson.map((i)=>PointM.fromJson(i)).toList();

    return  ListPointM(
      listOfPoint: photos
    );
  }
}

class PointM {
    PointM({
       required this.pointTransactionId,
       required this.preferredName,
       required this.number,
       required this.gamingDate,
       required this.type,
       required this.comment,
       required this.loyaltyPoints,
    });

    int pointTransactionId;
    String preferredName;
    int number;
    DateTime gamingDate;
    int type;
    String comment;
    int loyaltyPoints;

    factory PointM.fromJson(Map<String, dynamic> json) => PointM(
        pointTransactionId: json["PointTransactionID"],
        preferredName: json["PreferredName"],
        number: json["Number"],
        gamingDate: DateTime.parse(json["GamingDate"]) ,
        type: json["Type"],
        comment: json["Comment"] == null ? null : json["Comment"],
        loyaltyPoints: json["LoyaltyPoints"],
    );

    Map<String, dynamic> toJson() => {
        "PointTransactionID": pointTransactionId,
        "PreferredName": preferredName,
        "Number": number,
        "GamingDate": gamingDate.toIso8601String(),
        "Type": type,
        "Comment": comment == null ? null : comment,
        "LoyaltyPoints": loyaltyPoints,
    };
}





