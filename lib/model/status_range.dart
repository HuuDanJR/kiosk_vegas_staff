

import 'dart:convert';

StatusRange statusRangeFromJson(String str) => StatusRange.fromJson(json.decode(str));

String statusRangeToJson(StatusRange data) => json.encode(data.toJson());

class StatusRange {
    StatusRange({
        required this.status,
        required this.data,
    });

    bool status;
    DataRange data;

    factory StatusRange.fromJson(Map<String, dynamic> json) => StatusRange(
        status: json["status"],
        data: DataRange.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class DataRange {
    DataRange({
       required this.preferredName,
       required this.number,
       required this.loyaltyPointsFrame,
    });

    String preferredName;
    int number;
    int loyaltyPointsFrame;

    factory DataRange.fromJson(Map<String, dynamic> json) => DataRange(
        preferredName: json["PreferredName"],
        number: json["Number"],
        loyaltyPointsFrame: json["LoyaltyPoints_Frame"],
    );

    Map<String, dynamic> toJson() => {
        "PreferredName": preferredName,
        "Number": number,
        "LoyaltyPoints_Frame": loyaltyPointsFrame,
    };
}
