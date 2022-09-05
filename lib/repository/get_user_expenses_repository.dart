import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sabre_security_app/models/ModelUserExpenses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelUserExpenses> getUserExpenses() async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response = await http.post(Uri.parse(ApiUrls.userExpenses),
      headers: headers);

  print('SERVER DATA REQUEST Login::' +jsonEncode(map));
  print('SERVER DATA RESPONSE Login::' +response.body.toString());

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelUserExpenses.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}