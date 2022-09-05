import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelForgotPassword.dart';
import '../utils/ApiConstant.dart';

Future<ModelForgotPassword> forgotpassword(
  context,
  email,
) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var map = <String, dynamic>{};
  // ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  map['email'] = email;

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.forgotPassOtpUrl),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return ModelForgotPassword.fromJson(json.decode(response.body));
  } else {
    // Helpers.createSnackBar( response.statusCode.toString());
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}
