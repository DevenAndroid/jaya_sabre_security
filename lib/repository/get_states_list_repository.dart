import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sabre_security_app/models/ModelGetStates.dart';
import 'package:sabre_security_app/models/ModelRegisterStepOne.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/ApiConstant.dart';

Future<ModelGetStates> getStateList() async {

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.get(Uri.parse(ApiUrls.stateListUrl), headers: headers);

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelGetStates.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}