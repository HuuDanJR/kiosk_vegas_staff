// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    Country({
       required this.name,
       required this.tld,
       required this.cca2,
       required this.ccn3,
       required this.cca3,
       required this.cioc,
       required this.independent,
       required this.status,
       required this.unMember,
       required this.currencies,
       required this.idd,
       required this.capital,
       required this.altSpellings,
       required this.region,
      required  this.subregion,
      required  this.languages,
       required this.translations,
      required  this.latlng,
      required  this.landlocked,
      required  this.borders,
      required  this.area,
      required  this.demonyms,
     required   this.flag,
      required  this.maps,
      required  this.population,
      required  this.gini,
     required   this.fifa,
     required   this.car,
     required   this.timezones,
     required   this.continents,
     required   this.flags,
     required   this.coatOfArms,
     required   this.startOfWeek,
     required   this.capitalInfo,
     required   this.postalCode,
    });

    Name name;
    List<String> tld;
    String cca2;
    String ccn3;
    String cca3;
    String cioc;
    bool independent;
    String status;
    bool unMember;
    Currencies currencies;
    Idd idd;
    List<String> capital;
    List<String> altSpellings;
    String region;
    String subregion;
    Languages languages;
    Map<String, Translation> translations;
    List<int> latlng;
    bool landlocked;
    List<String> borders;
    int area;
    Demonyms demonyms;
    String flag;
    Maps maps;
    int population;
    Gini gini;
    String fifa;
    Car car;
    List<String> timezones;
    List<String> continents;
    CoatOfArms flags;
    CoatOfArms coatOfArms;
    String startOfWeek;
    CapitalInfo capitalInfo;
    PostalCode postalCode;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: Name.fromJson(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: Currencies.fromJson(json["currencies"]),
        idd: Idd.fromJson(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: Languages.fromJson(json["languages"]),
        translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<int>.from(json["latlng"].map((x) => x)),
        landlocked: json["landlocked"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        area: json["area"],
        demonyms: Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        gini: Gini.fromJson(json["gini"]),
        fifa: json["fifa"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: CoatOfArms.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: PostalCode.fromJson(json["postalCode"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies.toJson(),
        "idd": idd.toJson(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages.toJson(),
        "translations": Map.from(translations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "area": area,
        "demonyms": demonyms.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        "gini": gini.toJson(),
        "fifa": fifa,
        "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo.toJson(),
        "postalCode": postalCode.toJson(),
    };
}

class CapitalInfo {
    CapitalInfo({
        required this.latlng,
    });

    List<double> latlng;

    factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
    };
}

class Car {
    Car({
        required this.signs,
        required this.side,
    });

    List<String> signs;
    String side;

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: json["side"],
    );

    Map<String, dynamic> toJson() => {
        "signs": List<dynamic>.from(signs.map((x) => x)),
        "side": side,
    };
}

class CoatOfArms {
    CoatOfArms({
        required this.png,
        required this.svg,
    });

    String png;
    String svg;

    factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
    };
}

class Currencies {
    Currencies({
        required this.pen,
    });

    Pen pen;

    factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        pen: Pen.fromJson(json["PEN"]),
    );

    Map<String, dynamic> toJson() => {
        "PEN": pen.toJson(),
    };
}

class Pen {
    Pen({
        required this.name,
        required this.symbol,
    });

    String name;
    String symbol;

    factory Pen.fromJson(Map<String, dynamic> json) => Pen(
        name: json["name"],
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
    };
}

class Demonyms {
    Demonyms({
        required this.eng,
        required this.fra,
    });

    Eng eng;
    Eng fra;

    factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: Eng.fromJson(json["fra"]),
    );

    Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra.toJson(),
    };
}

class Eng {
    Eng({
        required this.f,
        required this.m,
    });

    String f;
    String m;

    factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
    );

    Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
    };
}

class Gini {
    Gini({
        required this.the2019,
    });

    double the2019;

    factory Gini.fromJson(Map<String, dynamic> json) => Gini(
        the2019: json["2019"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "2019": the2019,
    };
}

class Idd {
    Idd({
        required this.root,
        required this.suffixes,
    });

    String root;
    List<String> suffixes;

    factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
    };
}

class Languages {
    Languages({
        required this.aym,
        required this.que,
        required this.spa,
    });

    String aym;
    String que;
    String spa;

    factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        aym: json["aym"],
        que: json["que"],
        spa: json["spa"],
    );

    Map<String, dynamic> toJson() => {
        "aym": aym,
        "que": que,
        "spa": spa,
    };
}

class Maps {
    Maps({
        required this.googleMaps,
        required this.openStreetMaps,
    });

    String googleMaps;
    String openStreetMaps;

    factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
    );

    Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
    };
}

class Name {
    Name({
        required this.common,
        required this.official,
        required this.nativeName,
    });

    String common;
    String official;
    NativeName nativeName;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: NativeName.fromJson(json["nativeName"]),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName.toJson(),
    };
}

class NativeName {
    NativeName({
        required this.aym,
        required this.que,
        required this.spa,
    });

    Translation aym;
    Translation que;
    Translation spa;

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        aym: Translation.fromJson(json["aym"]),
        que: Translation.fromJson(json["que"]),
        spa: Translation.fromJson(json["spa"]),
    );

    Map<String, dynamic> toJson() => {
        "aym": aym.toJson(),
        "que": que.toJson(),
        "spa": spa.toJson(),
    };
}

class Translation {
    Translation({
        required this.official,
        required this.common,
    });

    String official;
    String common;

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}

class PostalCode {
    PostalCode({
        required this.format,
        required this.regex,
    });

    String format;
    String regex;

    factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
    );

    Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
    };
}
