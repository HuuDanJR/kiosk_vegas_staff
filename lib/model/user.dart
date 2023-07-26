import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.title,
    this.phone,
    this.email,
    this.number,
    this.dateofbirth,
    this.currentPoint,
    this.dailyPoint,
    this.dailyPointSl,
    this.dailyPointRl,
    this.weeklyPoint,
    this.tiername,
    this.monthlyPoint,
    this.totalPoint,
    this.cardtrack,
				this.dateFrame,
				this.framePoint,
  });
  String? id;
  String? title, phone, email, dateofbirth;
  String? name;
  String? cardtrack;
  int? number;
  int? currentPoint;
  int? dailyPoint;
  int? dailyPointSl;
  int? dailyPointRl;
  int? weeklyPoint;
  String? tiername;
  int? monthlyPoint;
  int? totalPoint;
  String? dateFrame;
  int? framePoint;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        title: json['title'],
        name: json["name"],
        number: json["number"],
        dateofbirth: json["dateofbirth"],
        phone: json['phone'],
        email: json['email'],
        currentPoint: json["currentPoint"],
        dailyPoint: json["dailyPoint"],
        dailyPointSl: json["dailyPointSL"],
        dailyPointRl: json["dailyPointRL"],
        weeklyPoint: json["weeklyPoint"],
        tiername: json["tiername"],
        monthlyPoint: json["monthlyPoint"],
        totalPoint: json["totalPoint"],

								dateFrame: json['dateFrame'],
								framePoint: json['framePoint']
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        'title': title,
        "number": number,
        'email': email,
        'dateofbirth': dateofbirth,
        'tierName': tiername,
        "phone": phone,
        "currentPoint": currentPoint,
        "dailyPoint": dailyPoint,
        "dailyPointSL": dailyPointSl,
        "dailyPointRL": dailyPointRl,
        "weeklyPoint": weeklyPoint,
        "tiername": tiername,
        "monthlyPoint": monthlyPoint,
        "totalPoint": totalPoint,
								"dateFrame":dateFrame,
								"famePoint":framePoint,
      };
}
