import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sabre_security_app/models/ModelRegisterStepThree.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper.dart';
import '../models/model_thired_step_response.dart';
import '../utils/ApiConstant.dart';

Future<ModelThiredStepResponse> registerStepThree(
  context,
  userId,
  experience,
  investigation_experience,
  driving_course_date,
  vaccinated,
  user_bio,
) async {
  var map = <String, dynamic>{};

  map['user_id'] = userId;
  map['experience'] = experience;
  map['investigation_experience'] = investigation_experience;
  map['driving_course_date'] = driving_course_date;
  map['vaccinated'] = vaccinated;
  map['user_bio'] = user_bio;

  print("Registration Step 3  $map");

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.registerStepThree),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return ModelThiredStepResponse.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}
