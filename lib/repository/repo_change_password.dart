import 'dart:convert';
import 'dart:io';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelCommonResponse> getChangePassword(
    BuildContext context,
    oldPassword,
    newPassword,
    confirmPassword,
    ) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  var map = <String, dynamic>{};

  map['old_password'] = oldPassword;
  map['new_password'] = newPassword;
  map['confirm_password'] = confirmPassword;
  //
  // final headers = {
  //   HttpHeaders.contentTypeHeader: 'application/json',
  //   HttpHeaders.acceptHeader: 'application/json',
  // };
  print("==========::::::::"+map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.changePassword),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    return ModelCommonResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(response.body);
  }
}
