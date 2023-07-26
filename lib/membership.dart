import 'package:flutter/material.dart';
import 'package:vegas_point_portal/model/pageviewM.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/itemCard.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class MemberShipPage extends StatefulWidget {
  String? name, number, level, totalPoint,current_point;
  MemberShipPage(
      {Key? key, this.number, this.name, this.level, this.totalPoint,this.current_point})
      : super(key: key);

  @override
  State<MemberShipPage> createState() => _MemberShipPageState();
}

class _MemberShipPageState extends State<MemberShipPage> {
  // final getx = Get.put(MyGetXController());
  late final name, number, totalPoint, accountBalance, level;

  late PageController _pageController;
  late int activePage, activePageView;

  late PageController _pageControllerView;
  List<PageViewM> listBody = [
    PageViewM(path1: 'P Tier (Ivory)', path2: StringFactory.label_benefit_p),
    PageViewM(path1: 'I Tier (Silver)', path2: StringFactory.label_benefit_i),
    PageViewM(path1: 'V Tier (Gold)', path2: StringFactory.label_benefit_v),
    PageViewM(path1: 'ONE (Red)', path2: StringFactory.label_benefit_one),
    PageViewM(
        path1: 'ONE+ (Dark Red)', path2: StringFactory.label_benefit_oneplus),
  ];
  List<PageViewM> images = [
    PageViewM(
      path1: "assets/icons/Vegas_membership_P-1.png",
      path2: "assets/icons/Vegas_membership_P-2.png",
    ),
    PageViewM(
      path1: "assets/icons/Vegas_membership_I-1.png",
      path2: "assets/icons/Vegas_membership_I-2.png",
    ),
    PageViewM(
      path1: "assets/icons/Vegas_membership_V-1.png",
      path2: "assets/icons/Vegas_membership_V-2.png",
    ),
    PageViewM(
      path1: "assets/icons/Vegas_membership_One-1.png",
      path2: "assets/icons/Vegas_membership_One-2.png",
    ),
    PageViewM(
      path1: "assets/icons/Vegas_membership_One+-1.png",
      path2: "assets/icons/Vegas_membership_One+-2.png",
    ),
  ];
  @override
  void initState() {
    super.initState();
    level = widget.level;
    switch (level) {
      case 'P':
        activePage = 0;
        activePageView = 0;
        break;
      case 'I':
        activePage = 1;
        activePageView = 1;
        break;
      case 'V':
        activePage = 2;
        activePageView = 2;
        break;
      case 'ONE':
        activePage = 3;
        activePageView = 3;
        break;
      case 'ONE+':
        activePage = 4;
        activePageView = 4;
        break;
      default:
        activePage = 0;
        activePageView = 0;
    }
    _pageController = PageController(viewportFraction: 0.8, initialPage: activePage, keepPage: true);
    _pageControllerView = PageController(viewportFraction: 1, initialPage: activePage, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageControllerView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          centerTitle: true,
          backgroundColor: MyColor.yellow_accent,
          title: textCustomNormalColorFont(
              color: MyColor.white,
              font: StringFactory.mainFont,
              size: 18,
              text: 'Membership Information'),
        ),
        body: Center(
          child: Container(
										alignment: Alignment.topCenter,
            height: height,
            decoration: BoxDecoration(
              color: MyColor.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: StringFactory.padding16),
            width: width,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: StringFactory.padding16),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: MyColor.grey_tab,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        MyColor.yellow_accent,
                        MyColor.yellow_gradient2,
                        MyColor.yellow_gradient1,
                        MyColor.yellow_accent,
                      ],
                    ),
                    border: Border.all(color: MyColor.white),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: height / 3,
                        child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (page) {
                              setState(() {
                                activePage = page;
                              });
                              _pageControllerView.jumpToPage(page);
                            },
                            itemCount: images.length,
                            pageSnapping: true,
                            itemBuilder: (context, pagePosition) {
                              bool active = pagePosition == activePage;
                              return itemPageView(
                                  height: height,
                                  list: images,
                                  position: pagePosition,
                                  path1:
                                      'assets/icons/Vegas_membership_One+-1.png',
                                  path2:
                                      "assets/icons/Vegas_membership_One+-2.png");
                            }),
                      ),
                      //dot to move pageview
                      Positioned(
                          right: StringFactory.padding,
                          child:
                              iconPageView(Icons.arrow_forward_ios_outlined, () {
                            movePage(isNext: true);
                          })),
                      //arrow left
                      Positioned(
                          left: StringFactory.padding,
                          child: iconPageView(Icons.arrow_back_ios_outlined, () {
                            movePage(isNext: false);
                          })),
                    ],
                  ),
                ),
                SizedBox(
                  height: StringFactory.padding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        textCustomNormalColorFont(
                          text: 'Your Current Level: ',
                          color: MyColor.black_text,
                          font: StringFactory.mainFont,
                          size: 14,
                        ),
                        textCustomNormalColorFont(
                          text: '${widget.level}',
                          color: MyColor.yellow_accent,
                          font: StringFactory.mainFont,
                          size: 22,
                        ),
                      ],
                    ),
                    
                    // textCustomNormalColorFont(
                    //   text: 'You need more 12000P to get to the next level',
                    //   color: MyColor.black_text,
                    //   font: StringFactory.mainFont,
                    //   size: 14,
                    // ),
                  ],
                ),
                SizedBox(
                  height: StringFactory.padding,
                ),
                Divider(color: MyColor.grey_tab),
                SizedBox(
                  height: StringFactory.padding16,
                ),
                //text and infor
                itemCard(
                  width: width,
                  text: 'Customer Name',
                  text2: widget.name,
                ),
                itemCard(
                  width: width,
                  text: 'Customer Number',
                  text2: widget.number,
                ),
                itemCard(
                  hasIcon: true,
                  onPress: () {
                    Navigator.of(context).pushNamed('/homepage');
                  },
                  width: width,
                  text: 'Point Available',
                  text2: '${widget.current_point} P',
                ),
                SizedBox(height: StringFactory.padding),
                SizedBox(
                  height: height / 3,
                  width: width,
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageControllerView,
                      onPageChanged: (page) {
                        setState(() {
                          activePageView = page;
                        });
                      },
                      itemCount: 5,
                      pageSnapping: true,
                      itemBuilder: (context, pagePosition) {
                        return itemPageViewChild(
                          height: height / 3,
                          width: width,
                          list: listBody,
                          position: pagePosition,
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Widget imageFromAsset(path) {
    return Image.asset(path, fit: BoxFit.fitHeight);
  }

  Widget itemPageViewChild({width, height, position, List<PageViewM>? list}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textCustomNormalColorFont(
            color: MyColor.yellow_accent,
            font: StringFactory.mainFont,
            text: list![position].path1,
            textalign: TextAlign.center,
            size: 18),
        Divider(color: MyColor.grey),
        textCustomNormalColorFont(
            textalign: TextAlign.left,
            color: MyColor.black_text,
            font: StringFactory.mainFont,
            text: list[position].path2,
            size: 12),
      ],
    );
  }

  Widget itemPageView({path1, path2, height, position, List<PageViewM>? list}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height / 3,
          child: imageFromAsset(list![position].path1),
        ),
        SizedBox(
          width: StringFactory.padding,
        ),
        Icon(Icons.star, color: MyColor.grey_tab),
        SizedBox(
          width: StringFactory.padding,
        ),
        SizedBox(
          height: height / 3,
          child: imageFromAsset(list[position].path2),
        )
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 17.5,
        height: 17.5,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  Widget iconPageView(icon, onPress) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(StringFactory.padding / 2),
          decoration: BoxDecoration(
            color: MyColor.grey_tab.withOpacity(.25),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 42,
            color: MyColor.white,
          ),
        ));
  }

  void movePage({bool isNext = true}) {
    if (isNext) {
      debugPrint('next page $activePage');
      setState(() {
        activePage++;
        activePageView++;
      });
    } else {
      debugPrint('prev page $activePage');
      setState(() {
        activePage--;
        activePageView--;
      });
    }
    // _pageController.jumpToPage(activePage); // for regular jump
    if (activePage > 0 || activePage <= 4) {
      _pageController.animateToPage(activePage,
          curve: Curves.ease, duration: const Duration(seconds: 1));
      _pageControllerView.jumpToPage(activePageView);
    }
  }
}
