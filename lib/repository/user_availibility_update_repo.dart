import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../models/model_user_availability_udpate.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelUserAvailablityUpdate> userAvailibilityUpdate(
    String monOpen,
    String monClose,
    String tueOpen,
    String tueClose,
    String wedOpen,
    String wedClose,
    String thuOpen,
    String thuClose,
    String friOpen,
    String friClose,
    String satOpen,
    String satClose,
    String sunOpen,
    String sunClose) async {
  var map = <String, dynamic>{};

  // if (monOpen.contains('AM')) {
  //   map['mon_open'] = monOpen.replaceAll('AM', '');
  // }
  // else if (monOpen.contains('PM')) {
  //   map['mon_open'] =
  //       (int.parse(monOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           monOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['mon_open'] = ' ';
  // }
  //
  // if (monClose.contains('AM')) {
  //   map['mon_close'] = monClose.replaceAll('AM', '');
  // }
  // else if (monClose.contains('PM')) {
  //   map['mon_close'] =
  //       (int.parse(monClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           monClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['mon_close'] = ' ';
  // }
  //
  // if (tueOpen.contains('AM')) {
  //   map['tue_open'] = tueOpen.replaceAll('AM', '');
  // }
  // else if (tueOpen.contains('PM')) {
  //   map['tue_open'] =
  //       (int.parse(tueOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           tueOpen.replaceAll('PM', '').split(':')[1];
  // } else
  // {
  //   map['tue_open'] = ' ';
  // }
  //
  // if (tueClose.contains('AM')) {
  //   map['tue_close'] = tueClose.replaceAll('AM', '');
  // }
  // else if (tueClose.contains('PM')) {
  //   map['tue_close'] =
  //       (int.parse(tueClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           tueClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['tue_close'] = ' ';
  // }
  //
  // if (wedOpen.contains('AM')) {
  //   map['wed_open'] = wedOpen.replaceAll('AM', '');
  // } else if
  // (wedOpen.contains('PM')) {
  //   map['wed_open'] =
  //       (int.parse(wedOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           wedOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['wed_open'] = ' ';
  // }
  //
  // if (wedClose.contains('AM')) {
  //   map['wed_close'] = wedClose.replaceAll('AM', '');
  // }
  // else if (wedClose.contains('PM')) {
  //   map['wed_close'] =
  //       (int.parse(wedClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           wedClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['wed_close'] = ' ';
  // }
  //
  // if (thuOpen.contains('AM')) {
  //   map['thu_open'] = thuOpen.replaceAll('AM', '');
  // }
  // else if (thuOpen.contains('PM')) {
  //   map['thu_open'] =
  //       (int.parse(thuOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           thuOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['thu_open'] = ' ';
  // }
  //
  // if (thuClose.contains('AM')) {
  //   map['thu_close'] = thuClose.replaceAll('AM', '');
  // }
  // else if (thuClose.contains('PM')) {
  //   map['thu_close'] =
  //       (int.parse(thuClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           thuClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['thu_close'] = ' ';
  // }
  //
  // if (friOpen.contains('AM')) {
  //   map['fri_open'] = friOpen.replaceAll('AM', '');
  // }
  // else if (friOpen.contains('PM')) {
  //   map['fri_open'] =
  //       (int.parse(friOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           friOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['fri_open'] = ' ';
  // }
  //
  // if (friClose.contains('AM')) {
  //   map['fri_close'] = friClose.replaceAll('AM', '');
  // }
  // else if (friClose.contains('PM')) {
  //   map['fri_close'] =
  //       (int.parse(friClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           friClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['fri_close'] = ' ';
  // }
  //
  // if (satOpen.contains('AM')) {
  //   map['sat_open'] = satOpen.replaceAll('AM', '');
  // }
  // else if (satOpen.contains('PM')) {
  //   map['sat_open'] =
  //       (int.parse(satOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           satOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['sat_open'] = ' ';
  // }
  //
  // if (satClose.contains('AM')) {
  //   map['sat_close'] = satClose.replaceAll('AM', '');
  // }
  // else if (satClose.contains('PM')) {
  //   map['sat_close'] =
  //       (int.parse(satClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           satClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['sat_close'] = ' ';
  // }
  //
  // if (sunOpen.contains('AM')) {
  //   map['sun_open'] = sunOpen.replaceAll('AM', '');
  // }
  // else if (sunOpen.contains('PM')) {
  //   map['sun_open'] =
  //       (int.parse(sunOpen.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           sunOpen.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['sun_open'] = ' ';
  // }
  //
  // if (sunClose.contains('AM')) {
  //   map['sun_close'] = sunClose.replaceAll('AM', '');
  // }
  // else if (sunClose.contains('PM')) {
  //   map['sun_close'] =
  //       (int.parse(sunClose.replaceAll('PM', '').split(':')[0]) + 12)
  //               .toString() +
  //           ':' +
  //           sunClose.replaceAll('PM', '').split(':')[1];
  // }
  // else {
  //   map['sun_close'] = ' ';
  // }

  map['mon_open'] = monOpen;
  map['mon_close'] = monClose;
  map['tue_open'] = tueOpen;
  map['tue_close'] = tueClose;
  map['wed_open'] = wedOpen;
  map['wed_close'] = wedClose;
  map['thu_open'] = thuOpen;
  map['thu_close'] = thuClose;
  map['fri_open'] = friOpen;
  map['fri_close'] = friClose;
  map['sat_open'] = satOpen;
  map['sat_close'] = satClose;
  map['sun_open'] = sunOpen;
  map['sun_close'] = sunClose;

  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  // OverlayEntry loader = Helpers.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  log("PARAMS :: " + map.toString());
  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  http.Response response = await http.post(
      Uri.parse(ApiUrls.userAvailabilityUpdate),
      body: jsonEncode(map),
      headers: headers);

  log("kjkjgkjg" + response.body.toString());
  if (response.statusCode == 200) {
    if (ModelUserAvailablityUpdate.fromJson(jsonDecode(response.body))
            .message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    //Helpers.hideLoader(loader);
    return ModelUserAvailablityUpdate.fromJson(json.decode(response.body));
  } else {
    // Helpers.hideLoader(loader) ;
    throw Exception(response.body);
  }
}
