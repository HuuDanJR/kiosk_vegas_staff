class VouchersListModel {
  VouchersListModel({
    required this.type,
    required this.id,
    required this.image,
    required this.profile,
    required this.vouchers,
  });

  String type;
  String id;
  String image;
  Profile profile;
  List<Voucher> vouchers;

  factory VouchersListModel.fromJson(Map<String, dynamic> json) =>
      VouchersListModel(
        type: json['type'] == null ? 'null' : json["type"],
        id: json['id'] == null ? 'null' : json["id"],
        image: json['image'] == null ? 'null' : json["image"],
        profile:json['profile'] ==null ? Profile(name: CustomerNumber(label: 'null', value: 'null'), customerNumber: CustomerNumber(label: 'null', value: 'null')) : Profile.fromJson(json["profile"]),
        vouchers: json['vouchers'] == null
            ? []
            : List<Voucher>.from(
                json["vouchers"].map((x) => Voucher.fromJson(x))),
      );
}

class Profile {
  Profile({
    required this.name,
    // required this.status,
    required this.customerNumber,
    // required this.email,
    // required this.mobile,
    // required this.permissions,
  });

  CustomerNumber name;
  // CustomerNumber status;
  CustomerNumber customerNumber;
  // CustomerNumber email;
  // CustomerNumber mobile;
  // Permissions permissions;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: CustomerNumber.fromJson(json["name"]),
        // status: CustomerNumber.fromJson(json["status"]),
        customerNumber: CustomerNumber.fromJson(json["customer_number"]),
        // email: CustomerNumber.fromJson(json["email"]),
        // mobile: CustomerNumber.fromJson(json["mobile"]),
        // permissions: Permissions.fromJson(json["permissions"]),
      );
}

class CustomerNumber {
  CustomerNumber({
    required this.label,
    required this.value,
  });

  String label;
  String value;

  factory CustomerNumber.fromJson(Map<String, dynamic> json) => CustomerNumber(
        label: json['label'] == null ? 'null' : json["label"],
        value: json['value'] == null ? 'null' : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class Permissions {
  Permissions({
    required this.mail,
    required this.mobile,
    required this.phone,
    required this.sms,
    required this.email,
  });

  int mail;
  int mobile;
  int phone;
  int sms;
  int email;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        mail: json["mail"],
        mobile: json["mobile"],
        phone: json["phone"],
        sms: json["sms"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "mobile": mobile,
        "phone": phone,
        "sms": sms,
        "email": email,
      };
}

class Voucher {
  Voucher({
    required this.voucherStatus,
    required this.voucherName,
    required this.validFrom,
    required this.validUntil,
    required this.cashValue,
    required this.redemptionType,

    // required this.voucherId,
    // required this.redeemed,
    // required this.voucherType,
    // required this.voucherCategory,
    // required this.hospitalityItem,
    // required this.pointsValue,
    // required this.otherValue,
    // required this.faceValue,
    // required this.redeemFromComps,
    // required this.autoPrint,
    // required this.voucherAction,
    // required this.redemptionMessage,
    // required this.description,
    // required this.terms,
    // required this.shortcode,
    // required this.campaign,
    // required this.redemptionChannels,
    // required this.allowOverride,
    // required this.currency,
    // required this.template,
  });

  VoucherStatus voucherStatus;
  CustomerNumber voucherName;
  Redeemed validFrom;
  Redeemed validUntil;
  HospitalityItem redemptionType;
  ValueCash cashValue;

  // HospitalityItem hospitalityItem;
  // CustomerNumber voucherId;
  // CustomerNumber voucherType;
  // Redeemed redeemed;
  // CustomerNumber voucherCategory;
  // Value pointsValue;
  // CustomerNumber otherValue;
  // CustomerNumber faceValue;
  // AutoPrint redeemFromComps;
  // AutoPrint autoPrint;
  // CustomerNumber voucherAction;
  // CustomerNumber redemptionMessage;
  // CustomerNumber description;
  // CustomerNumber terms;
  // CustomerNumber shortcode;
  // CustomerNumber campaign;
  // List<String> redemptionChannels;
  // bool allowOverride;
  // String currency;
  // Template template;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        voucherStatus: VoucherStatus.fromJson(json["voucher_status"]),
        voucherName: CustomerNumber.fromJson(json["voucher_name"]),
        validFrom: Redeemed.fromJson(json["valid_from"]),
        validUntil: Redeemed.fromJson(json["valid_until"]),
        redemptionType: HospitalityItem.fromJson(json["redemption_type"]),
        cashValue: ValueCash.fromJson(json["cash_value"]),
        // cashValue:Value.fromJson(json["cash_value"]),

        // voucherId: CustomerNumber.fromJson(json["voucher_id"]),
        // hospitalityItem: HospitalityItem.fromJson(json["hospitality_item"]),
        // voucherCategory: CustomerNumber.fromJson(json["voucher_category"]),
        // voucherType: CustomerNumber.fromJson(json["voucher_type"]),
        // redeemed: Redeemed.fromJson(json["redeemed"]),
        // pointsValue: Value.fromJson(json["points_value"]),
        // otherValue: CustomerNumber.fromJson(json["other_value"]),
        // faceValue: CustomerNumber.fromJson(json["face_value"]),
        // redeemFromComps: AutoPrint.fromJson(json["redeem_from_comps"]),
        // autoPrint: AutoPrint.fromJson(json["auto_print"]),
        // voucherAction: CustomerNumber.fromJson(json["voucher_action"]),
        // redemptionMessage: CustomerNumber.fromJson(json["redemption_message"]),
        // description: CustomerNumber.fromJson(json["description"]),
        // terms: CustomerNumber.fromJson(json["terms"]),
        // shortcode: CustomerNumber.fromJson(json["shortcode"]),
        // campaign: CustomerNumber.fromJson(json["campaign"]),
        // redemptionChannels:
        //     List<String>.from(json["redemption_channels"].map((x) => x)),
        // allowOverride: json["allow_override"],
        // currency: json["currency"],
        // template: Template.fromJson(json["template"]),
      );
}

class AutoPrint {
  AutoPrint({
    required this.label,
    required this.value,
  });

  String label;
  bool value;

  factory AutoPrint.fromJson(Map<String, dynamic> json) => AutoPrint(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class ValueCash {
  ValueCash({
    required this.label,
    required this.value,
  });

  String label;
  dynamic value;

  factory ValueCash.fromJson(Map<String, dynamic> json) => ValueCash(
        label: json['label'] == null ? '' : json["label"],
        value: json['value'] == null ? '' : json["value"],
      );
}

class HospitalityItem {
  HospitalityItem({
    required this.label,
    required this.value,
    required this.name,
  });

  String label;
  String value;
  String name;

  factory HospitalityItem.fromJson(Map<String, dynamic> json) =>
      HospitalityItem(
        label: json['label'] == null ? null : json["label"],
        value: json['value'] == null ? null : json["value"],
        name: json['name'] == null ? null : json["name"],
      );
}

class Redeemed {
  Redeemed({
    required this.label,
    required this.value,
    required this.utc,
  });

  String label;
  String value;
  DateTime? utc;

  factory Redeemed.fromJson(Map<String, dynamic> json) => Redeemed(
        label: json['label'] == null ? 'null' : json["label"],
        value: json["value"] ?? null,
        utc: json["utc"] == null ? null : DateTime.parse(json["utc"]),
      );
}

// class Template {
//   Template({
//     required this.displayAmount,
//     required this.qrColor,
//   });

//   int displayAmount;
//   String qrColor;

//   factory Template.fromJson(Map<String, dynamic> json) => Template(
//         displayAmount: json["display_amount"],
//         qrColor: json["qr_color"],
//       );

// }

class VoucherStatus {
  VoucherStatus({
    required this.valid,
    required this.status,
    required this.reasonText,
    required this.shortText,
    required this.longText,
    required this.detail,
    required this.statusCode,
  });

  bool valid;
  String status;
  String reasonText;
  String shortText;
  String longText;
  String detail;
  String statusCode;

  factory VoucherStatus.fromJson(Map<String, dynamic> json) => VoucherStatus(
        valid: json['valid'] == null ? null : json["valid"],
        status: json['status'] == null ? null : json["status"],
        reasonText: json['reason_text'] == null ? null : json["reason_text"],
        shortText: json['short_text'] == null ? null : json["short_text"],
        longText: json['long_text'] == null ? null : json["long_text"],
        detail: json['detail'] == null ? null : json["detail"],
        statusCode: json['status_code'] == null ? null : json["status_code"],
      );
}
