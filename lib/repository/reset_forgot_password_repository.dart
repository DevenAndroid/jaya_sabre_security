import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ModelCreateNewPassword.dart';
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant1.dart';

Future<ModelCreateNewPasswords> resetForgotPassword(
    email,
    newPassword,
    confirmPassword,
    BuildContext context) async {
  var map = <String, dynamic>{};

  map["email"] = email;
  map["password"] = newPassword;
  map["confirm_password"] = confirmPassword;

  http.Response response = await http.post(Uri.parse(ApiUrls1.createNewPassword),
    body: (map) ,
  );
  print("Server Response :: "+response.body.toString());

  if (response.statusCode == 200) {
    EasyLoading.dismiss();

    return ModelCreateNewPasswords.fromJson(json.decode(response.body));
  } else {
  throw Exception(response.body);
  }
}