// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DemoLocalization {
// 		DemoLocalization(Locale locale);
//   // DemoLocalization(this.locale);
//   late final Locale locale;
		
//   static DemoLocalization? of(BuildContext context) {
//     return Localizations.of<DemoLocalization>(context, DemoLocalization);
//   }

//   late Map<String, String> _localizedValues;

//   Future<void> load() async {
//     String jsonStringValues = await rootBundle.loadString(
//         'lang/${'${locale.languageCode}_${locale.countryCode}'}.json');
//     // debugPrint(jsonStringValues.toString());
//     Map<dynamic, dynamic> mappedJson = json.decode(jsonStringValues);
//     _localizedValues = mappedJson.map((key, value) {
//       return MapEntry(key, value.toString());
//     });
//     // print(_localizedValues.toString());
//   }

//   String? translate(String key) {
//     return _localizedValues[key];
//   }

//   // static member to have simple access to the delegate from Material App
//   static const LocalizationsDelegate<DemoLocalization> delegate =
//       _DemoLocalizationsDelegate();
// }

// class _DemoLocalizationsDelegate
//     extends LocalizationsDelegate<DemoLocalization> {
//   const _DemoLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return ['zh', 'zh', 'en'].contains(locale.languageCode);
//   }

//   @override
//   Future<DemoLocalization> load(Locale locale) async {
//     DemoLocalization localization =  DemoLocalization(locale);
//     await localization.load();
//     return localization;
//   }

//   @override
//   bool shouldReload(LocalizationsDelegate<DemoLocalization> old) => false;
// }
