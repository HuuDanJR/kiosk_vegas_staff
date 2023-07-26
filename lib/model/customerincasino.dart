import 'dart:convert';

CustomerInCasino customerInCasinoFromJson(String str) => CustomerInCasino.fromJson(json.decode(str));

String customerInCasinoToJson(CustomerInCasino data) => json.encode(data.toJson());

class CustomerInCasino {
    CustomerInCasino({
       required this.empty,
       required this.failureReason,
       required this.success,
       required this.customers,
    });

    CustomerInCasinoClass empty;
    FailureReasonClass failureReason;
    String success;
    Customers customers;

    factory CustomerInCasino.fromJson(Map<String, dynamic> json) => CustomerInCasino(
        empty: CustomerInCasinoClass.fromJson(json["\u0024"]),
        failureReason: FailureReasonClass.fromJson(json["FailureReason"]),
        success: json["Success"],
        customers: Customers.fromJson(json["Customers"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
        "FailureReason": failureReason.toJson(),
        "Success": success,
        "Customers": customers.toJson(),
    };
}

class Customers {
    Customers({
       required this.customerData,
    });

    List<CustomerDatum> customerData;

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        customerData: List<CustomerDatum>.from(json["CustomerData"].map((x) => CustomerDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "CustomerData": List<dynamic>.from(customerData.map((x) => x.toJson())),
    };
}

class CustomerDatum {
    CustomerDatum({
      required  this.age,
      required  this.cardNumber,
      required  this.cashlessBalance,
      required  this.colour,
      required  this.colourHtml,
      required  this.compBalance,
      required  this.compStatusColour,
      required  this.compStatusColourHtml,
      required  this.forename,
      required  this.freeplayBalance,
      required  this.gender,
      required  this.hasOnlineAccount,
      required  this.hideCompBalance,
      required  this.isGuest,
      required  this.loyaltyBalance,
      required  this.loyaltyPointsAvailable,
      required  this.membershipTypeName,
      required  this.middleName,
      required  this.number,
      required  this.playerTierName,
      required  this.playerTierShortCode,
      required  this.premiumPlayer,
      required  this.surname,
       required this.title,
      required  this.validMembership,
    });

    String age;
    String cardNumber;
    String cashlessBalance;
    String colour;
    String colourHtml;
    String compBalance;
    String compStatusColour;
    String compStatusColourHtml;
    String forename;
    String freeplayBalance;
    String gender;
    String hasOnlineAccount;
    String hideCompBalance;
    String isGuest;
    String loyaltyBalance;
    String loyaltyPointsAvailable;
    String membershipTypeName;
    String middleName;
    String number;
    String playerTierName;
    String playerTierShortCode;
    String premiumPlayer;
    String surname;
    String title;
    String validMembership;

    factory CustomerDatum.fromJson(Map<String, dynamic> json) => CustomerDatum(
        age: json["Age"],
        cardNumber: json["CardNumber"],
        cashlessBalance: json["CashlessBalance"],
        colour: json["Colour"],
        colourHtml: json["ColourHTML"],
        compBalance: json["CompBalance"],
        compStatusColour: json["CompStatusColour"],
        compStatusColourHtml: json["CompStatusColourHTML"],
        forename: json["Forename"],
        freeplayBalance: json["FreeplayBalance"],
        gender: json["Gender"],
        hasOnlineAccount: json["HasOnlineAccount"],
        hideCompBalance: json["HideCompBalance"],
        isGuest: json["IsGuest"],
        loyaltyBalance: json["LoyaltyBalance"],
        loyaltyPointsAvailable: json["LoyaltyPointsAvailable"],
        membershipTypeName: json["MembershipTypeName"],
        middleName: json["MiddleName"],
        number: json["Number"],
        playerTierName: json["PlayerTierName"],
        playerTierShortCode: json["PlayerTierShortCode"],
        premiumPlayer: json["PremiumPlayer"],
        surname: json["Surname"],
        title: json["Title"],
        validMembership: json["ValidMembership"],
    );

    Map<String, dynamic> toJson() => {
        "Age": age,
        "CardNumber": cardNumber,
        "CashlessBalance": cashlessBalance,
        "Colour": colour,
        "ColourHTML": colourHtml,
        "CompBalance": compBalance,
        "CompStatusColour": compStatusColour,
        "CompStatusColourHTML": compStatusColourHtml,
        "Forename": forename,
        "FreeplayBalance": freeplayBalance,
        "Gender": gender,
        "HasOnlineAccount": hasOnlineAccount,
        "HideCompBalance": hideCompBalance,
        "IsGuest": isGuest,
        "LoyaltyBalance": loyaltyBalance,
        "LoyaltyPointsAvailable": loyaltyPointsAvailable,
        "MembershipTypeName": membershipTypeName,
        "MiddleName": middleName,
        "Number": number,
        "PlayerTierName": playerTierName,
        "PlayerTierShortCode": playerTierShortCode,
        "PremiumPlayer": premiumPlayer,
        "Surname": surname,
        "Title": title,
        "ValidMembership": validMembership,
    };
}


class CustomerInCasinoClass {
    CustomerInCasinoClass({
       required this.xmlnsA,
       required this.xmlnsI,
    });

    String xmlnsA;
    String xmlnsI;

    factory CustomerInCasinoClass.fromJson(Map<String, dynamic> json) => CustomerInCasinoClass(
        xmlnsA: json["xmlns:a"],
        xmlnsI: json["xmlns:i"],
    );

    Map<String, dynamic> toJson() => {
        "xmlns:a": xmlnsA,
        "xmlns:i": xmlnsI,
    };
}

class FailureReasonClass {
    FailureReasonClass({
       required this.empty,
    });

    FailureReason empty;

    factory FailureReasonClass.fromJson(Map<String, dynamic> json) => FailureReasonClass(
        empty: FailureReason.fromJson(json["\u0024"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
    };
}

class FailureReason {
    FailureReason({
       required this.iNil,
    });

    String iNil;

    factory FailureReason.fromJson(Map<String, dynamic> json) => FailureReason(
        iNil: json["i:nil"],
    );

    Map<String, dynamic> toJson() => {
        "i:nil": iNil,
    };
}


