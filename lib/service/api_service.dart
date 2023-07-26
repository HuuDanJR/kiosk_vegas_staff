import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:vegas_point_portal/model/customer.dart';
import 'package:vegas_point_portal/model/customerframe.dart';
import 'package:vegas_point_portal/model/customerincasino.dart';
import 'package:vegas_point_portal/model/dateframedata.dart';
import 'package:vegas_point_portal/model/machine_player.dart';
import 'package:vegas_point_portal/model/status.dart';
import 'package:vegas_point_portal/model/status_range.dart';
import 'package:vegas_point_portal/model/voucherslist.dart';
import 'package:vegas_point_portal/service/url.dart';

class ServiceAPIs {
  Dio dio = Dio();
  Future searchCustomerName({keyword}) async {
    final response = await dio.get(
      UrlString.search_customer_name + keyword,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print(response.data);
    // return response.data;
    return CustomerList.fromJson(response.data);
  }

  Future getCardTrackByNumber({number}) async {
    final response = await dio.get(
      UrlString.cardtrack_by_number + number,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // debugPrint('Card Track Number $number: ${response.data}');
    return response.data;
  }

  Future postCustomerImage({computerName, customerNumber}) async {
    Map<String, dynamic> body = {
      "computer": computerName,
      "number": customerNumber,
    };
    final response = await dio.post(
      UrlString.customer_image,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // return CustomerImage.fromJson(response.data);
    return response.data;
  }

  Future postMachinePlayer({gammingDate, customerNumber}) async {
    Map<String, dynamic> body = {
      "date": gammingDate,
      "customer_number": customerNumber,
    };
    final response = await dio.post(
      UrlString.machine_player,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return MachinePlayer.fromJson(response.data);
    // return response.data;
  }

  Future postMachinePlayerByMCNumber({gammingDate, machinenumber}) async {
    Map<String, dynamic> body = {
      "date": gammingDate,
      "machine_number": machinenumber,
    };
    final response = await dio.post(
      UrlString.machine_player_by_machinenumber,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return MachinePlayer.fromJson(response.data);
    // return response.data;
  }

  // Future postActiveVoucher({computerName, customerNumber}) async {
  //   Map<String, dynamic> body = {
  //     "computer": computerName,
  //     "number": customerNumber,
  //   };
  //   final response = await dio.post(
  //     UrlString.active_voucher,
  //     data: body,
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //       receiveTimeout: 3000,
  //       sendTimeout: 3000,
  //       followRedirects: false,
  //       validateStatus: (status) {
  //         return true;
  //       },
  //       headers: {
  //         'Content-type': 'application/json; charset=UTF-8',
  //       },
  //     ),
  //   );
  //   return Voucher.fromJson(response.data);
  // }
  //VOUCHERS SYSTEM
  Future<VouchersListModel> getAllVouchers({customerNumber, context}) async {
    final response = await dio.get(
      UrlString.all_vouchers + customerNumber,
    );
    return VouchersListModel.fromJson(response.data);
  }

  //LIST FRAME POINT CUSTOMER
  Future listFramePointCustomer({date}) async {
    print('listFramePointCustomer');
    Map<String, dynamic> body = {
      "date": date,
    };
    final response = await dio.post(
      UrlString.findcustomerFrame,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        // receiveTimeout: 3000,
        // sendTimeout: 3000,
        // followRedirects: false,
        // validateStatus: (status) {
        //   return true;
        // },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print(response.data);
    // return response.data;
    return ListCustomerFrame.fromJson(response.data);
  }

  Future postCustomerInCasino({computerName, gammingDate}) async {
    Map<String, dynamic> body = {
      "computer": computerName,
      "gammingdate": gammingDate,
    };
    final response = await dio.post(
      UrlString.customer_in_casino,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        // receiveTimeout: 3000,
        // sendTimeout: 3000,
        // followRedirects: false,
        // validateStatus: (status) {
        //   return true;
        // },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print('response data from request: ${response.data}');
    return CustomerInCasino.fromJson(response.data);
  }

  Future postPointCardTrack(
      {id, today, today2, startWeek, endWeek, startMonth, endMonth}) async {
    Map<String, dynamic> body = {
      "id": id,
      "dateToday": today,
      "dateToday2": today2,
      "startDateWeek": startWeek,
      "endDateWeek": endWeek,
      "startDateMonth": startMonth,
      "endDateMonth": endMonth,
    };
    final response = await dio.post(
      UrlString.point_cardtrack,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print('response data from request: ${response.data}');
    return Status.fromJson(response.data);
    // return response.data;
  }

  Future postPointCardTrackRange(
      {id, String? startDate, String? endDate}) async {
    Map<String, dynamic> body = {
      "id": id,
      "startDate": startDate,
      "endDate": endDate,
    };
    final response = await dio.post(
      UrlString.point_cardtrack_range,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // return response.data;
    return StatusRange.fromJson(response.data);
  }

  Future postPointNumberRange(
      {number, String? startDate, String? endDate}) async {
    Map<String, dynamic> body = {
      "number": number,
      "startDate": startDate,
      "endDate": endDate,
    };
    final response = await dio.post(
      UrlString.point_cardtrack_number,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // return response.data;
    return StatusRange.fromJson(response.data);
  }

  //BY NUMBER
  Future<StatusRange> postPointCardNumber(
      {number, String? startDate, String? endDate}) async {
    Map<String, dynamic> body = {
      "number": number,
      "startDate": startDate,
      "endDate": endDate,
    };
    final response = await dio.post(
      UrlString.point_cardtrack_number,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );

    // print(response.data);
    return StatusRange.fromJson(response.data);
  }

  Future createFeedBack(
      {type, name, number, date, phone, email, note, type_name}) async {
    Map<String, dynamic> body = {
      "name": name,
      "date": date,
      "number": number,
      "note": note,
      "phone": phone,
      "email": email,
      "type": type,
      "type_name": type_name,
    };
    final response = await dio.post(
      UrlString.create_feedBack,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return response.data;
  }

  Future<DateFrameDataList> findDateFrameByNumber(number) async {
    final response = await dio.post(
      UrlString.findDateFrame,
      data: {"number": number},
    );
    // print(response.data);
    return DateFrameDataList.fromJson(response.data);
    // print(model.photos.first.forename);
  }

  Future postPrint(
      // {url, cusName, cusNumber, cPoint, dPoint, wPoint, mPoint, fPoint,slPoint,rlPoint}
      {url,
      cusName,
      cusNumber,
      cPoint,
      dPoint,
      wPoint,
      mPoint,
      fPoint,
      slPoint,
      rlPoint}) async {
    Map<String, dynamic> body = {
      "cusname": "$cusName",
      "cusnumber": "$cusNumber",
      "cpoint": "$cPoint",
      "dpoint": "$dPoint",
      "wpoint": "$wPoint",
      "mpoint": "$mPoint",
      "fpoint": "$fPoint",
      "slpoint": "$slPoint",
      "rlpoint": "$rlPoint",
    };
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          receiveTimeout: 3000,
          sendTimeout: 3000,
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );
      // print('print data: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        // print(e.response?.statusCode);
      } else {
        // print(e.message);
      }
    }
  }
}
