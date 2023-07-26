

class Voucher {
    Voucher({
        required this.empty,
        required this.failureReason,
        required this.success,
        required this.vouchers,
    });

    VoucherClass empty;
    FailureReasonClass failureReason;
    String success;
    Vouchers? vouchers;

    factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        empty: VoucherClass.fromJson(json["\u0024"]),
        failureReason: FailureReasonClass.fromJson(json["FailureReason"]),
        success: json["Success"],
        vouchers:json['Vouchers'] == null || json['Vouchers'] == '' ? null :  Vouchers.fromJson(json["Vouchers"]),
    );
}

class VoucherClass {
    VoucherClass({
        required this.xmlnsA,
        required this.xmlnsI,
    });

    String xmlnsA;
    String xmlnsI;

    factory VoucherClass.fromJson(Map<String, dynamic> json) => VoucherClass(
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

class Vouchers {
    Vouchers({
        required this.crmVoucher,
    });

    List<CrmVoucher> crmVoucher;

    factory Vouchers.fromJson(Map<String, dynamic> json) => Vouchers(
        crmVoucher:   List<CrmVoucher>.from(json["CrmVoucher"].map((x) => CrmVoucher.fromJson(x))),
    );
}

class CrmVoucher {
    CrmVoucher({
       required this.canBeRedeemedAtPos,
      required  this.displayName,
      required  this.isValid,
      required  this.value,
      required  this.voucherId,
      required  this.voucherType,
    });

    String canBeRedeemedAtPos;
    String displayName;
    String isValid;
    String value;
    String voucherId;
    String voucherType;

    factory CrmVoucher.fromJson(Map<String, dynamic> json) => CrmVoucher(
        canBeRedeemedAtPos: json["CanBeRedeemedAtPos"],
        displayName: json["DisplayName"],
        isValid: json["IsValid"],
        value: json["Value"],
        voucherId: json["VoucherId"],
        voucherType: json["VoucherType"],
    );
}
