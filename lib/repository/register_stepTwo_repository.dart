import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sabre_security_app/models/ModelRegisterStepOne.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/ApiConstant.dart';

Future<ModelRegisterStepOne> registerStepTwo(
    guardCard,
    guardCardNumber,
    firearmLicense,
    fireLiceNumber,
    caCcw,
    caCcwNumber,
    hrCert,
    hrAgency,
    anyOtherLicense,
    bsisGuardCardCertificate,
    bsisExposedCertificate,
    caCcwCertificate,
    hrCertificate,
    List<String> selectedMedicalTraining,
    medicalTrainingCertificate,
    BuildContext context) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  var userId = pref.getString('userId');

  var medicalTrainings = '';
  for (var item in selectedMedicalTraining) {
    if (medicalTrainings == '') {
      medicalTrainings = item;
    } else {
      medicalTrainings = medicalTrainings + ',' + item;
    }
  }

  map['user_id'] = userId;
  map['guard_card'] = guardCard;
  map['guard_card_number'] = guardCardNumber;
  map['firearm_license'] = firearmLicense;
  map['fire_lice_number'] = fireLiceNumber;
  map['ca_ccw'] = caCcw;
  map['ca_ccw_number'] = caCcwNumber;
  map['hr_cert'] = hrCert;
  map['hr_agency'] = hrAgency;
  map['any_other_license'] = anyOtherLicense;
  map['bsis_guard_card_certificate'] = bsisGuardCardCertificate;
  map['bsis_exposed_certificate'] = bsisExposedCertificate;
  map['ca_ccw_certificate'] = caCcwCertificate;
  map['hr_certificate'] = hrCertificate;
  map['medical_training'] = medicalTrainings;
  map['medical_training_certificate'] = medicalTrainingCertificate;

  print("registration registerStepTwo Details" + map.toString());

  // OverlayEntry loader = Helper.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.registerStepTwo),
      body: jsonEncode(map), headers: headers);

  print('SERVER DATA REQUEST Registration::' + jsonEncode(map));
  print('SERVER DATA RESPONSE Registration::' + response.body.toString());

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelRegisterStepOne.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
