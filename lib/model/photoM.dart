// To parse this JSON data, do
//
//     final photoM = photoMFromJson(jsonString);

import 'dart:convert';

List<PhotoM> photoMFromJson(String str) => List<PhotoM>.from(json.decode(str).map((x) => PhotoM.fromJson(x)));

String photoMToJson(List<PhotoM> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoM {
    PhotoM({
       required this.albumId,
       required this.id,
       required this.title,
       required this.url,
       required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory PhotoM.fromJson(Map<String, dynamic> json) => PhotoM(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
