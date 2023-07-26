import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegas_point_portal/getx/my_controller.dart';
import 'package:vegas_point_portal/model/voucherslist.dart';
import 'package:vegas_point_portal/service/api_service.dart';
import 'package:vegas_point_portal/util/mycolor.dart';
import 'package:vegas_point_portal/util/stringFactory.dart';
import 'package:vegas_point_portal/util/validate_field.dart';
import 'package:vegas_point_portal/widget/itemvoucher.dart';
import 'package:vegas_point_portal/widget/myprogress_circular.dart';
import 'package:vegas_point_portal/widget/searchField.dart';
import 'package:vegas_point_portal/widget/widget.dart';

class VouchersPageText extends StatefulWidget {
  VouchersPageText({Key? key}) : super(key: key);

  @override
  State<VouchersPageText> createState() => _VouchersPageTextState();
}

class _VouchersPageTextState extends State<VouchersPageText> {
  final service_api = ServiceAPIs();
  String? name;
  String? number = '';
  bool isSearch = false;
  final searchInputController = TextEditingController();
  final myCtl = Get.put(MyGetXController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // print('my input value ${myCtl.valueSearchInput.value}');
      if (myCtl.valueSearchInput.value == '') {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print('show menu filter');
        //   },
        //   child: Icon(Icons.filter_alt_rounded),
        // ),
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, //change your color here
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    if (myCtl.isSearchVoucherInput.value == false) {
                      myCtl.turnOnVoucherSearchInput();
                    } else {
                      myCtl.turnOffVoucherSearchInput();
                    }
                  },
                  icon: const Icon(Icons.search)),
              // IconButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (context) {
              //             return AlertDialog();
              //           });
              //     },
              //     icon: const Icon(Icons.filter_alt))
            ],
            title: GetBuilder<MyGetXController>(
                builder: (controller) =>
                    // controller.isSearchVoucherInput.value?
                    searchTextField(
                        controller: searchInputController,
                        hasInitValue: true,
                        valueInit: controller.valueSearchInput.value,
                        hint: 'All Vouchers',
                        onSubmit: (String value) {
                          if (validateFieldSearch(value, context)) {
                            controller.saveSearchInputValue(value);
                            controller.turnOnVouchersStatus();
                            print('value save input voucherpage: ${controller.valueSearchInput.value}');
                            if (value != controller.valueSearchInput.value) {
                              controller.turnOnVouchersStatus();
                            }
                          }
                        })
                // : textCustomNormalColorFont(
                //     color: MyColor.white,
                //     size: 18,
                //     text: 'Available Vouchers'),
                )),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MyColor.white,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: StringFactory.padding16,
            ),
            width: width,
												height: height,
            child: myCtl.valueSearchInput.value == '' ||
                    myCtl.valueSearchInput.value == null
                ? Center(
                    child: Text(
                    'Enter Customer Number',
                    style: TextStyle(color: MyColor.black_text),
                    textAlign: TextAlign.center,
                  ))
                : GetBuilder<MyGetXController>(
                    builder: (controller) => FutureBuilder(
                      future: service_api.getAllVouchers(
                        customerNumber: controller.valueSearchInput.value,
                      ),
                      builder: ((context, snapshot) {
                        late final model = snapshot.data as VouchersListModel;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return myprogress_circular();
                        } else if (model.vouchers.isEmpty ||
                            snapshot.data == null) {
                          return textCustomNormalColorFont(
                              color: MyColor.black_text,
                              text: 'No Vouchers',
                              size: 14);
                        } else if (snapshot.hasError) {
                          return textCustomNormalColorFont(
                              color: MyColor.black_text,
                              text: 'An error orcur',
                              size: 14);
                        }
                        return 
																								
																								ListView.builder(
                            // 		GridView.builder(
                            // 																						 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: 2,
                            //   crossAxisSpacing: StringFactory.padding,
                            //   mainAxisSpacing: StringFactory.padding,
                            //   childAspectRatio: 5,
                            // ),
                            padding: EdgeInsets.symmetric( vertical: StringFactory.padding16),
                            itemCount: model.vouchers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  itemVoucher(
                                      width: width,
                                      status:'${model.vouchers[index].voucherStatus.statusCode}',
                                      dateFrom:'${model.vouchers[index].validFrom.value}',
                                      dateTo:'${model.vouchers[index].validUntil.value}',
                                      voucherName:'${model.vouchers[index].voucherName.value}',
                                      voucherType:'${model.vouchers[index].redemptionType.name}'
																																						// status: 'REDEEMED',
																																						// dateFrom: '2022-12-10',
																																						// dateTo: '2022-12-10',
																																						// voucherName: 'TEST',
																																						// voucherType: 'ABCE'
																																		),
                                  SizedBox(height: StringFactory.padding)
                                ],
                              );
                            });
                      }),
                    ),
                  )));
  }
}
