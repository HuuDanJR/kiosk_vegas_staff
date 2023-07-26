import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/pointpage.dart';
import 'package:vegas_point_portal/pointpage_w_number.dart';
import 'package:vegas_point_portal/searchpagecontainer.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/detect_platform.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/stringformat.dart';
import 'package:vegas_point_portal/voucherspage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var focusNode = FocusNode();
  bool enable = false;
  final myCtl = Get.put(MyGetXController());
  // PageController pageController = PageController();
  String? startDateText, endDateText;
  final service = ServiceAPIs();
  String? number;
  String? idPass;
  final format = StringFormat();
  final today = DateTime.now();
  int _selectedIndex = 0;
  bool? isWebMobile;

  Status model = Status(
      status: false,
      data: Data(
          email: '',
          phone: '',
          tiername: '',
          title: '',
          preferredName: '',
          dateofbirth: '',
          number: 0,
          loyaltyPoints: 0,
          loyaltyPointsToday: 0,
          loyaltyPointTodaySlot: 0,
          loyaltyPointTodayRLTB: 0,
          loyaltyPointsCurrent: 0,
          loyaltyPointsWeek: 0,
          loyaltyPointsMonth: 0));

  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  final controllerInput = TextEditingController();

  double groupAligment = -1.0;
  bool isShowDarkMode = false;

  Map<int, Color> colorMap = {
    50: Color.fromRGBO(147, 205, 72, .1),
    100: Color.fromRGBO(147, 205, 72, .2),
    200: Color.fromRGBO(147, 205, 72, .3),
    300: Color.fromRGBO(147, 205, 72, .4),
    400: Color.fromRGBO(147, 205, 72, .5),
    500: Color.fromRGBO(147, 205, 72, .6),
    600: Color.fromRGBO(147, 205, 72, .7),
    700: Color.fromRGBO(147, 205, 72, .8),
    800: Color.fromRGBO(147, 205, 72, .9),
    900: Color.fromRGBO(147, 205, 72, 1),
  };
  @override
  void initState() {
    	isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS ||  defaultTargetPlatform == TargetPlatform.android);
    if (DateTime.now().hour > 19 && DateTime.now().hour < 3) {
      setState(() {
        isShowDarkMode = true;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  void dispose() {
    controllerInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final List<Widget> mainContents = [
      GetBuilder<MyGetXController>(
        builder: (controller) => controller.hasMoveToPointNumber.value == false
            ? PointPage()
            : PointPageWithNumber(
                hasLeading: true,
              ),
      ),
      GetBuilder<MyGetXController>(
        builder: (controller) => controller.hasMoveToVouchers.value == false
            ? SearchCustomerPageContainer()
            : PointPageWithNumber(
                hasLeading: true,
              ),
      ),
      VouchersPage(),
      // SettingPage(),
      // TurnOffPage(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primaryColor: MyColor.yellow_accent,
          primarySwatch: Colors.amber,
          unselectedWidgetColor: Colors.grey, //
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: isShowDarkMode == false
                  ? MyColor.yellow_accent
                  : MyColor.blacklight),
          // colorScheme: ColorScheme(brightness: Brightness.light, primary: MyColor.yellow, onPrimary: MyColor.yellow_accent, secondary: MyColor.blue, onSecondary: MyColor.yellow, error: MyColor.black_text, onError: MyColor.black_text, background: MyColor.white, onBackground: MyColor.grey_tab, surface: MyColor.white, onSurface: MyColor.white),
          useMaterial3: true,
          // ignore: deprecated_member_use
          // useTextSelectionTheme: true,
          brightness:isShowDarkMode == false ? Brightness.light : Brightness.dark),
      home: Scaffold(
          bottomNavigationBar:detectPlatform() == false ? const SizedBox(height: 0,width:0) :  BottomNavigationBar(
            mouseCursor: SystemMouseCursors.grab,
            selectedFontSize: 12,
            selectedIconTheme: IconThemeData(color: MyColor.yellow_accent, ),
            selectedItemColor: MyColor.yellow_accent,
            backgroundColor: Colors.white10,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Points'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'Vouchers')
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          body: SafeArea(
            child: Row(
              children: <Widget>[
                GetBuilder<MyGetXController>(
                  builder: (controller) =>	detectPlatform() == false 
                      ? NavigationRail(
                          trailing: Column(
                            children: [
                              SizedBox(
                                height: StringFactory.padding32,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isShowDarkMode = !isShowDarkMode;
                                    });
                                  },
                                  icon: Icon(isShowDarkMode == false
                                      ? Icons.dark_mode_outlined
                                      : Icons.light_mode_outlined),
                                  color: MyColor.grey),
                              SizedBox(
                                height: StringFactory.padding,
                              ),
                              // IconButton(
                              //     onPressed: () {
                              //       print('close screen');
                              //     },
                              //     icon: Icon(Icons.power_settings_new)),
                              SizedBox(
                                height: StringFactory.padding16,
                              ),
                            ],
                          ),
                          groupAlignment: groupAligment,
                          // selectedIndex: controller.indexTab.value,
                          // onDestinationSelected: (int index) {
                          //   // controller.setIndexTab(index);
                          //   controller.indexTab == index.obs;
                          // },
                          selectedIndex: _selectedIndex,
                          onDestinationSelected: (int index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          labelType: labelType,
                          destinations: const <NavigationRailDestination>[
                            NavigationRailDestination(
                              icon: Icon(Icons.favorite_border),
                              selectedIcon: Icon(Icons.favorite_border),
                              label: Text('Points'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.search),
                              selectedIcon: Icon(Icons.search_outlined),
                              label: Text('Search'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.auto_awesome),
                              selectedIcon: Icon(Icons.auto_awesome),
                              label: Text('Vouchers'),
                            ),

                            // NavigationRailDestination(
                            //   icon: Icon(Icons.settings_outlined),
                            //   selectedIcon: Icon(Icons.settings_outlined),
                            //   label: Text('Setting'),
                            // ),
                          ],
                        )
                      : const SizedBox(height: 0, width: 0),
                ),
                VerticalDivider(
                    thickness: 1, width: 1, color: MyColor.grey_tab),
                // This is the main content.
                Expanded(
                    child: GetBuilder<MyGetXController>(
                  builder: (controller) => mainContents[_selectedIndex],
                )),
                // 		Expanded(child: PageView(controller: pageController,
                //   scrollDirection: Axis.vertical,
                // 		physics: const NeverScrollableScrollPhysics(),
                //   children: <Widget>[
                //     const PointPage(),
                // 				VouchersPage(),
                // 				SearchCustomerPageContainer(),
                //   ],
                // ))
              ],
            ),
          )),
    );
  }
}
