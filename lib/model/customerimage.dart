import 'dart:convert';

class CustomerImage {
    CustomerImage({
       required this.empty,
       required this.failureReason,
       required this.success,
       required this.image,
    });

    CustomerImageClass empty;
    FailureReasonClass failureReason;
    String success;
    String image;

    factory CustomerImage.fromJson(Map<String, dynamic> json) => CustomerImage(
        empty: CustomerImageClass.fromJson(json["\u0024"]),
        failureReason: FailureReasonClass.fromJson(json["FailureReason"]),
        success: json["Success"],
        image: json['Image'] == null ? 'abc' : json['Image'],
    );

   
}

class CustomerImageClass {
    CustomerImageClass({
       required this.xmlnsA,
       required this.xmlnsI,
    });

    String xmlnsA;
    String xmlnsI;

    factory CustomerImageClass.fromJson(Map<String, dynamic> json) => CustomerImageClass(
        xmlnsA: json["xmlns:a"],
        xmlnsI: json["xmlns:i"],
    );

   
}

class FailureReasonClass {
    FailureReasonClass({
       required this.empty,
    });

    FailureReason empty;

    factory FailureReasonClass.fromJson(Map<String, dynamic> json) => FailureReasonClass(
        empty: FailureReason.fromJson(json["\u0024"]),
    );

    
}

class FailureReason {
    FailureReason({
        required this.iNil,
    });

    String iNil;

    factory FailureReason.fromJson(Map<String, dynamic> json) => FailureReason(
        iNil: json["i:nil"],
    );

}
