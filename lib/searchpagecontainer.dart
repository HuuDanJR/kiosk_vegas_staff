import 'package:flutter/material.dart';
import 'package:vegas_point_portal/customerincasinopage.dart';
import 'package:vegas_point_portal/listsearchsuggest.dart';
import 'package:vegas_point_portal/machineplayerpage.dart';
import 'package:vegas_point_portal/searchpage.dart';
import 'package:vegas_point_portal/util/detect_platform.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class SearchCustomerPageContainer extends StatefulWidget {
  SearchCustomerPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchCustomerPageContainer> createState() =>
      _SearchCustomerPageContainerState();
}

class _SearchCustomerPageContainerState
    extends State<SearchCustomerPageContainer>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          onTap: (indedx) {
            if (indedx == 0) {
            } else if (indedx == 1) {
            } else if (indedx == 2) {}
          },

          indicatorSize: TabBarIndicatorSize.label,
          labelColor: MyColor.white,
          labelStyle: TextStyle(fontSize: 18),
          indicatorColor: Colors.transparent,
          indicatorWeight: 1.0,
          // labelPadding: EdgeInsets.only(bottom: StringFactory.padding4),
          unselectedLabelColor: Colors.white70,
          tabs: <Widget>[
            Tab(child: detectPlatform() == true
                    ? const Tooltip(
                        message: 'Customer In Casino', child: Icon(Icons.group))
                    : const Text(
                        'Customer In Casino',
                        style: TextStyle(fontSize: 14),
                      )),
            Tab(child: detectPlatform() == true
                    ? const Tooltip(
                        message: 'Machine Playing',
                        child: Icon(Icons.airplay_rounded))
                    : const Text(
                        'Machine Playing',
                        style: TextStyle(fontSize: 14),
                      )),
            Tab(child: detectPlatform() == true
                    ? const Tooltip(
                        message: 'Search Customer', child: Icon(Icons.search))
                    : const Text(
                        'Search Customer',
                        style: TextStyle(fontSize: 14),
                      )),
          ],
          controller: tabController,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CustomerInCasinoPage(),
            // ListSuggestPage(),
            MachinePlayerPage(),
            SearchCustomerPage(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
