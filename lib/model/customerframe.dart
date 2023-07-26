// To parse this JSON data, do
//
//     final customerFrame = customerFrameFromJson(jsonString);

import 'dart:convert';

List<CustomerFrame> customerFrameFromJson(String str) =>
    List<CustomerFrame>.from(
        json.decode(str).map((x) => CustomerFrame.fromJson(x)));

String customerFrameToJson(List<CustomerFrame> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCustomerFrame {
  List<CustomerFrame> list = [];

  ListCustomerFrame({required this.list});

  factory ListCustomerFrame.fromJson(List<dynamic> parsedJson) {
    List<CustomerFrame> photos = [];
    photos = parsedJson.map((i) => CustomerFrame.fromJson(i)).toList();
    return ListCustomerFrame(
      list: photos,
    );
  }
}

// To parse this JSON data, do
//
//     final customerFrame = customerFrameFromJson(jsonString);


class CustomerFrame {
    CustomerFrame({
      required  this.number,
       required this.forename,
       required this.frameStartDate,
       required this.frameEndDate,
    });

    int number;
    String forename;
    DateTime frameStartDate;
    DateTime frameEndDate;

    factory CustomerFrame.fromJson(Map<String, dynamic> json) => CustomerFrame(
        number: json["number"],
        forename: json["forename"],
        frameStartDate: DateTime.parse(json["frame_start_date"]),
        frameEndDate: DateTime.parse(json["frame_end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "forename": forename,
        "frame_start_date": frameStartDate.toIso8601String(),
        "frame_end_date": frameEndDate.toIso8601String(),
    };
}

