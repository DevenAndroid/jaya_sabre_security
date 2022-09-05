import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ModelLicensesData.dart';
import '../utils/ApiConstant.dart';

Future<ModelLicensesRegistration> getLicensesDetails(userid, guard_card, card_number, firearm_licenses, firelice_number, ca_ccw,
    ca_ccw_number, hr_cert, other_licenses, guard_card_certificate , exposed_certificate , ca_ccw_certificate, hr_certificate, medical_training,
    medical_training_certificate
    ) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString('fcmToken');

  map['user_id'] = userid;
  map['guard_card'] = guard_card;
  map['guard_card_number'] = card_number;
  map['firearm_license'] = firearm_licenses;
  map['fire_lice_number'] = firelice_number;
  map['ca_ccw'] = ca_ccw;
  map['ca_ccw_number'] = ca_ccw_number;
  map['hr_cert'] = hr_cert;
  map['any_other_license'] = other_licenses;
  map['bsis_guard_card_certificate'] = guard_card_certificate;
  map['bsis_exposed_certificate'] = exposed_certificate;
  map['ca_ccw_certificate'] = ca_ccw_certificate;
  map['hr_certificate'] = hr_certificate;
  map['medical_training'] = medical_training;
  map['medical_training_certificate'] = medical_training_certificate;

  // map['device_id'] = pref.getString('deviceId');

  print("Licenses Details"+map.toString());

  // OverlayEntry loader = Helper.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.loginUrl),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelLicensesRegistration.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}