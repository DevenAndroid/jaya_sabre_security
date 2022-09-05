import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sabre_security_app/models/ModelAddUser.dart';
import 'package:sabre_security_app/models/model_assignment.dart';
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelCommonResponse> verifyOTPRepo(context, id) async {

  // OverlayEntry loader = Helpers.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);
  Map<String, dynamic> map = {};
  map["user_id"] = id;

  print(map);

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    // HttpHeaders.acceptHeader: 'application/json',
  };
  final response = await http.post(Uri.parse(ApiUrls.verifyOTPUrl),
      body: (map),
      // headers: headers
  );

  if (response.statusCode == 200) {
    // Helpers.hideLoader(loader);
    return ModelCommonResponse.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}