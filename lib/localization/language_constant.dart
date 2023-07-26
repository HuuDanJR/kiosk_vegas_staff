// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vegas_point_portal/localization/demo_localization.dart';

// const String LAGUAGE_CODE = 'languageCode';
// const String COUNTRY_CODE = 'countryCode';

// //languages code
// const String ENGLISH = 'en';
// const String CHINESE = 'zh';
// const String HONGKONG = 'zh';

// // Future<Locale> setLocale(String languageCode) async {
// //   SharedPreferences _prefs = await SharedPreferences.getInstance();
// //   await _prefs.setString(LAGUAGE_CODE, languageCode);
// //   return _locale(languageCode);
// // }

// // Future<Locale> getLocale() async {
// //   SharedPreferences _prefs = await SharedPreferences.getInstance();
// //   String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
// //   return _locale(languageCode);
// // }
// Future<Locale> setLocale(String languageCode, String countryCode) async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   await _prefs.setString(LAGUAGE_CODE, languageCode);
//   await _prefs.setString(COUNTRY_CODE, countryCode);
//   return _locale(languageCode, countryCode);
// }

// Future<Locale> getLocale() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
//   String countryCode = _prefs.getString(COUNTRY_CODE) ?? "US";
//   return _locale(languageCode, countryCode);
// }

// Locale _locale(String languageCode, String countryCode) {
//   if (languageCode == ENGLISH) {
//     return Locale(ENGLISH, 'US');
//   } else if (languageCode == CHINESE && countryCode == 'CN') {
//     return Locale(CHINESE, "CN");
//   } else if (languageCode == HONGKONG && countryCode == 'HK') {
//     return Locale(HONGKONG, "HK");
//   } else {
//     return Locale(ENGLISH, 'US');
//   }
// }
// // Locale _locale(String languageCode) {
// //   switch (languageCode) {
// //     case ENGLISH:
// //       return Locale(ENGLISH, 'US');
// //     case CHINESE:
// //       return Locale(CHINESE, "CN");
// //     case HONGKONG:
// //       return Locale(HONGKONG, "HK");
// //     default:
// //       return Locale(ENGLISH, 'US');
// //   }
// // }

// String? getTranslated(BuildContext context, String key) {
//   return DemoLocalization.of(context)!.translate(key);
// }
