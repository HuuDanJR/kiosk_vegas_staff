import 'package:flutter/material.dart';
import 'package:vegas_point_portal/customerincasinopage.dart';
import 'package:vegas_point_portal/machineplayerpage.dart';
import 'package:vegas_point_portal/searchpage.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class PointPageContainer extends StatefulWidget {
  PointPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PointPageContainer> createState() =>
      _PointPageContainerState();
}

class _PointPageContainerState
    extends State<PointPageContainer>
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
							title:	TabBar(
						  onTap: (indedx) {
						    if (indedx == 0) {
						      
						    } else if (indedx == 1) {
						      
						    } 
										else if (indedx == 2) {
						      
						    }
						  },

								indicatorSize: TabBarIndicatorSize.tab,
								indicatorColor: Colors.transparent,
								// indicatorWeight: 1.0,
								// labelPadding: EdgeInsets.only(bottom: StringFactory.padding4),
								unselectedLabelColor: Colors.white38,
						  tabs: <Widget>[
						    Tab(
						      child: textCustomNormalColorFont(
                      text: 'Customer In Casino',
                      size: 16),
						    ),
						    Tab(
						      child: textCustomNormalColorFont(
                      text: 'Machine Playing',
                      size: 16),
						    ),
						    Tab(child: textCustomNormalColorFont(
                      text: 'Search Customer',
                      size: 16),
						    ),
						  ],
						  controller: tabController,
						) ,
      ),
      body: SizedBox(
							height:height,
							width:width,
        child: TabBarView(
          children: <Widget>[
            CustomerInCasinoPage(),
            MachinePlayerPage(),
            SearchCustomerPage(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
