import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vegas_point_portal/home.dart';
import 'package:vegas_point_portal/localization/demo_localization.dart';
import 'package:vegas_point_portal/membership.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/voucherspage.dart';
import 'package:vegas_point_portal/welcome.dart';
import 'package:vegas_point_portal/widget/app_behaviour.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter();
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'STAFF KIOSK CHECK V2',
        // supportedLocales: [
        //   Locale("en", "US"),
        //   Locale("zh", "CN"),
        //   Locale("zh", "HK"),
        // ],
        // localizationsDelegates: [
        //   DemoLocalization.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // localeResolutionCallback: (locale, supportedLocales) {
        //   if (locale == null) {
        //     debugPrint("*language locale is null!!!");
        //     debugPrint("*${supportedLocales.first}");
        //     return supportedLocales.first;
        //   }
        //   for (Locale supportedLocale in supportedLocales) {
        //     // if (supportedLocale.languageCode == locale.languageCode ||
        //     //     supportedLocale.countryCode == locale.countryCode) {
        //     //   debugPrint("*language ok $supportedLocale");
        //     //   return supportedLocale;
        //     // }
        //     if (supportedLocale.languageCode == locale.languageCode &&
        //         supportedLocale.countryCode == locale.countryCode) {
        //       debugPrint("*language support $supportedLocale");
        //       return supportedLocale;
        //     }
        //   }
        //   debugPrint("*language to fallback ${supportedLocales.first}");
        //   debugPrint("*${supportedLocales.first}");
        //   return supportedLocales.first;
        // },
        theme: ThemeData(
									fontFamily: 'Quicksand',
          brightness: Brightness.light,
          primaryColor: MyColor.colorPrimary,
          cardTheme: CardTheme(color: MyColor.yellow_accent),
          buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme(
                  brightness: Brightness.light,
                  primary: MyColor.yellow_accent,
                  onPrimary: MyColor.yellow,
                  secondary: MyColor.grey_tab,
                  onSecondary: MyColor.black_text,
                  error: MyColor.grey,
                  onError: MyColor.grey,
                  background: MyColor.white,
                  onBackground: MyColor.white,
                  surface: MyColor.grey,
                  onSurface: MyColor.grey)),
          colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.grey,
          ),
          textTheme: const TextTheme(),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        debugShowMaterialGrid: false,
        home: const WelcomePage(),
        routes: <String, WidgetBuilder>{
          '/welcome': (BuildContext context) => const WelcomePage(),
          '/homepage': (BuildContext context) => const MyHomePage(),
          '/membership': (BuildContext context) => MemberShipPage(),
          '/point': (BuildContext context) => MemberShipPage(),
          '/map': (BuildContext context) => MemberShipPage(),
          '/vouchers': (BuildContext context) => VouchersPage(),
        });
  }
}
