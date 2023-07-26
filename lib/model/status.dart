import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

class Status {
  Status({
    required this.status,
    required this.data,
  });
  bool status;
  Data data;
  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data(
      {required this.preferredName,
      required this.phone,
      required this.title,
      required this.email,
      required this.tiername,
      required this.number,
      required this.dateofbirth,
      required this.loyaltyPoints,
      required this.loyaltyPointsCurrent,
      required this.loyaltyPointsToday,
      required this.loyaltyPointsWeek,
      required this.loyaltyPointsMonth,
      required this.loyaltyPointTodaySlot,
      required this.loyaltyPointTodayRLTB});

  String preferredName;
  String phone, email, title, tiername,dateofbirth;
  int number;
  int loyaltyPoints;
  int loyaltyPointsCurrent;
  int loyaltyPointsToday;
  int loyaltyPointsWeek;
  int loyaltyPointsMonth;
  int loyaltyPointTodaySlot;
  int loyaltyPointTodayRLTB;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        preferredName: json["PreferredName"] ?? "unidentified",
        number: json["Number"] ?? '',
        email: json['Email'] ?? "",
        phone: json['Phone'] ?? "",
        dateofbirth: json['DateOfBirth'] ?? "",
        title: json['Title'] ?? "",
        tiername: json['TierName'] ?? "",
        loyaltyPoints: json["LoyaltyPoints"],
        loyaltyPointsCurrent: json["LoyaltyPoints_Current"],
        loyaltyPointsToday: json["LoyaltyPoints_Today"],
        loyaltyPointTodaySlot: json["LoyaltyPoints_Today_Slot"],
        loyaltyPointTodayRLTB: json["LoyaltyPoints_Today_RLTB"],
        loyaltyPointsWeek: json["LoyaltyPoints_Week"],
        loyaltyPointsMonth: json["LoyaltyPoints_Month"],
      );
}
